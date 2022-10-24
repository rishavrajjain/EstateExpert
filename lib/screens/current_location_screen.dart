import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../api/apiCall.dart';
import '../model/places_response.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};
  double? latitudeNum;
  double? longitudeNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Future<void> _init() async {
  //   positionOn = await _determinePosition();
  // }

  @override
  Widget build(BuildContext context) {
    final mqHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      appBar: AppBar(
        title: const Text("Current location"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            latitudeNum != null && longitudeNum != null
                ? FutureBuilder<List<Result>>(
                    future: UsersApi.getUsersData(
                        latitude: latitudeNum!, longitude: longitudeNum!),
                    builder: (context, snapshot) {
                      final users = snapshot.data;

                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.black,
                          ));
                        default:
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    'Some error occurred! ${snapshot.error}'));
                          } else {
                            return Positioned(
                              top: 65,
                              left: 0.0,
                              right: 0.0,
                              //bottom: 0.0,
                              child: SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: users!.length,
                                  itemBuilder:
                                      (BuildContext context, int position) {
                                    return SizedBox(
                                      width: 200,
                                      height: 100,
                                      child: users[position]
                                              .categories!
                                              .isNotEmpty
                                          ? Card(
                                              color: Colors.black,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      users[position]
                                                              .categories?[0]
                                                              .name ??
                                                          '',
                                                      style: const TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white),
                                                    ),
                                                    Expanded(
                                                      child: Image.network(
                                                        users[position]
                                                                .categories![0]
                                                                .icon!
                                                                .prefix!
                                                                .toString() +
                                                            '32' +
                                                            users[position]
                                                                .categories![0]
                                                                .icon!
                                                                .suffix
                                                                .toString(),
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    );
                                  },
                                ),
                              ),
                            );
                            //return Text('fsfsd ${users![0].name}');
                          }
                      }
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0, right: 42),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () async {
              Position position = await _determinePosition();
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 14)));

              print('------Here----');
              print(position.latitude.toString() +
                  '       ' +
                  position.longitude.toString());
              markers.clear();

              markers.add(
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: LatLng(
                    position.latitude,
                    position.longitude,
                  ),
                ),
              );

              setState(() {});
            },
            label: const Text("Click to find"),
            icon: const Icon(Icons.location_history),
          ),
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      latitudeNum = position.latitude;
      longitudeNum = position.longitude;
    });

    return position;
  }
}

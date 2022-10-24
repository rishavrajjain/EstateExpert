import 'package:flutter/material.dart';
import 'package:google_maps_flutter_tutorial/screens/current_location_screen.dart';
import 'package:google_maps_flutter_tutorial/screens/nearby_places_screen.dart';
import 'package:google_maps_flutter_tutorial/screens/polyline_screen.dart';
import 'package:google_maps_flutter_tutorial/screens/search_places_screen.dart';
import 'package:google_maps_flutter_tutorial/screens/simple_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color:  Colors.white,
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const SimpleMapScreen();
                    }));
                  },
                  child: const Text("Simple Map")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const CurrentLocationScreen();
                    }));
                  },
                  child: const Text("User current location")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const SearchPlacesScreen();
                    }));
                  },
                  child: const Text("Search Places")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const NearByPlacesScreen();
                    }));
                  },
                  child: const Text("Near by Places")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const PolylineScreen();
                    }));
                  },
                  child: const Text("Polyline between 2 points"))
            ],
          ),
        ),
      ),
    );
  }
}

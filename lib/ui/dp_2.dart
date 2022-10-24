import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/apiCall.dart';
import '../model/places_response.dart';

class DetailPage extends StatefulWidget {
  var dataHouse;

  DetailPage([this.dataHouse]);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: NetworkImage("${widget.dataHouse['image']}"),
                          fit: BoxFit.cover)),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${widget.dataHouse['price']}",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13),
                              ),
                              Text(
                                "/month",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: isLiked == false
                                  ? const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "${widget.dataHouse['name']}",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${widget.dataHouse['place']}",
                      style: GoogleFonts.montserrat(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.bed_outlined),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "${widget.dataHouse['beds']} Bed",
                            style: GoogleFonts.manrope(
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.bathtub_outlined),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "${widget.dataHouse['baths']} Bath",
                            style: GoogleFonts.manrope(
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.fullscreen),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "${widget.dataHouse['size']} m",
                            style: GoogleFonts.manrope(
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Details",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                  ],
                ),
                const Text(
                    "A house is a single-unit residential building. It may range in complexity from a rudimentary hut to a complex structure of wood, masonry, concrete or other material, outfitted with plumbing, electrical, and heating, ventilation, and air conditioning systems.[1][2] Houses use a range of different roofing systems to keep precipitation "),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Places nearby",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 15),
                ),
                FutureBuilder<List<Result>>(
                  future: UsersApi.getUsersData(
                      latitude: 27.1751, longitude: 78.0421),
                  builder: (context, snapshot) {
                    final users = snapshot.data;

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                                  'Some error occurred! ${snapshot.error}'));
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.horizontal,
                            itemCount: users!.length,
                            itemBuilder: (context, position) {
                              if (users[position].categories!.isNotEmpty) {
                                print('---Image---');
                                print(users[position]
                                        .categories![0]
                                        .icon!
                                        .prefix! +
                                    '120' +
                                    users[position]
                                        .categories![0]
                                        .icon!
                                        .suffix!);
                                return ExpandablePanel(
                                  header: Row(
                                    children: [
                                      Image.network(
                                        users[position]
                                                .categories![0]
                                                .icon!
                                                .prefix!
                                                .toString() +
                                            '64' +
                                            users[position]
                                                .categories![0]
                                                .icon!
                                                .suffix
                                                .toString(),
                                        color: Colors.black,
                                      ),
                                      Expanded(
                                        child: Text(
                                          users[position].categories?[0].name ??
                                              '',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      users[position].name != null
                                          ? Row(
                                              children: [
                                                Text(
                                                  users[position].name!,
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                // Text(users[position].name!),
                                              ],
                                            )
                                          : const SizedBox(),
                                      users[position].location != null
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Address: ',
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    users[position]
                                                        .location!
                                                        .formattedAddress!,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                            fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            )
                                          : const SizedBox(),
                                      users[position].distance != null
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Distance: ',
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    users[position]
                                                            .distance
                                                            .toString() +
                                                        'm',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                            fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          );
                          //return Text('fsfsd ${users![0].name}');
                        }
                    }
                  },
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.0)
                ])),
          ),
        ),
        //Button
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Booked"),
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ],
    )));
  }
}

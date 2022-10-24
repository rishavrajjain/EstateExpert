import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class HomeUIScreen extends StatefulWidget {
  const HomeUIScreen({Key? key}) : super(key: key);

  @override
  _HomeUIScreenState createState() => _HomeUIScreenState();
}

class _HomeUIScreenState extends State<HomeUIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://cdn.decoist.com/wp-content/uploads/2014/10/18.36.54-House-by-Daniel-Libeskind.jpg"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 25,
            ),
            Text("Discover dream house \n from smartphone",
                style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w700, fontSize: 26),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 13,
            ),
            Text(
              "The No. 1 App for searching and finding \nthe most suitable house",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(color: Colors.grey.shade400),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Container(
                width: 270,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.workSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.manrope(
                      color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                ),
                Text(
                  " Log In",
                  style: GoogleFonts.manrope(fontWeight: FontWeight.w800),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

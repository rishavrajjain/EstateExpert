import 'package:flutter/material.dart';
import 'package:google_maps_flutter_tutorial/home_screen.dart';
import 'package:google_maps_flutter_tutorial/ui/home_main_screen.dart';

import 'new_homy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeUIScreen(),//HomeScreen(),// NewHomeScreen(),//const 
    );
  }
}

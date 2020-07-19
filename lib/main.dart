import 'package:flutter/material.dart';
import 'package:youtube_trip_advisor_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Advisor App',
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
      home: HomeScreen(),
    );
  }
}

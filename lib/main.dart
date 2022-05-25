import 'package:challenge_2/screens/all_widget.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

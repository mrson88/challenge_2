import 'package:challenge_2/screens/all_widget.dart';
import 'package:flutter/material.dart';
import 'package:challenge_2/screens/home.dart';
// import 'package:challenge_2/screens/all_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: All_Widget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

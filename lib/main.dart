import 'package:challenge_2/constants.dart';
import 'package:challenge_2/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: backgroundColor,
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

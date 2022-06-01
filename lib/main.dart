import 'package:challenge_2/screens/home_page.dart';
import 'package:flutter/material.dart';

String asdas = '{"name":"Khdskjas","email":"hdajkdha"}';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

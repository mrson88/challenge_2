import 'package:flutter/material.dart';

class All_Widget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
          child: SafeArea(
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
          )
        ]),
      )),
    );
  }
}

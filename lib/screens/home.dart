import 'package:flutter/material.dart';
import 'all_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> entries = <String>[
  'ALL SCREENS',
  'B',
  'C',
  'E',
  'F',
  'G',
  'H',
  'I',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P'
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              color: Colors.blue,
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(
                    ' ${entries[index]}',
                  ),
                  onPressed: () async {
                    if (index == 0) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return All_Widget();
                          },
                        ),
                      );
                    }
                  },
                ),
                // child: Center(child: Text('Entry ${entries[index]}')),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}

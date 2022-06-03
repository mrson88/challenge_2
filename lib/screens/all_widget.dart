import 'package:challenge_2/constants.dart';
import 'package:flutter/material.dart';

class All_Widget extends StatefulWidget {
  @override
  State<All_Widget> createState() => _All_WidgetState();
}

final List<String> image = <String>[
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
];
final List<String> nameperson = [
  'Herman Pope',
  'Sue Cadwell',
  'Ada Reyes',
  'Haley Dooman'
];

class _All_WidgetState extends State<All_Widget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff20242f),
      body: getbody(context),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.stream),
              label: 'Streams',
              backgroundColor: naviColor),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_off),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffff54b64),
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget getbody(BuildContext context) {
  return SafeArea(
    child: ListView(
      padding: const EdgeInsets.only(left: 10, right: 21, top: 15, bottom: 15),
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: headCharacter,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.add,
                  color: headCharacter,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(
            'Messages',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.normal,
                color: headCharacter),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nameperson.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.center,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                );
              },
              // children: <Widget>[
              //   const Component_1(),
              //   const Component_1(),
              //   const Component_1(),
              //   const Component_1(),
              //   const Component_1(),
              //   const Component_1(),
              // ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: SizedBox(height: 1),
          color: Colors.black,
        ),
        const Component_2(),
        const Component_2(),
        const Component_2(),
        const Component_2(),
        const Component_2(),
        const Component_2(),
        const Component_2(),
        const Component_2(),
        const Component_2(),
      ],
    ),
  );
}

class Component_1 extends StatelessWidget {
  const Component_1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 21, top: 15, bottom: 18),
      child: Container(
        height: 115,
        child: Column(
          children: [
            const child_component(),
            const Text('Mrson', style: charName),
          ],
        ),
      ),
    );
  }
}

class child_component extends StatelessWidget {
  const child_component({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('images/2.png'),
          ),
        ),
        Positioned(
            top: 48,
            left: 42,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
            ))
      ],
    );
  }
}

class Component_2 extends StatelessWidget {
  const Component_2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Column(
        children: [
          Row(
            children: <Widget>[
              const child_component(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Herman Pope',
                        style: charMes,
                      ),
                      const Text("Hey! How' it going?", style: charMes),
                      Container(
                        margin: const EdgeInsets.only(top: 21.5),
                        height: 1,
                        color: Colors.black,
                        child: const SizedBox(
                          height: 1,
                          width: double.infinity,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Text(
                  '4:49PM',
                  style: hourColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

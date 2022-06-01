import 'package:challenge_2/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:challenge_2/data/full_data.dart';
import 'dart:convert';
import 'package:challenge_2/data/convert_data.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var userJson = await rootBundle.loadString('assets/datas/users.json');
    var chatJson = await rootBundle.loadString('assets/datas/chats.json');
    var decodeUSer = jsonDecode(userJson);
    var decodeChat = jsonDecode(chatJson);

    var result = decodeUSer['results'];
    print(result.length);
    return result;

    // print(result.length);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfff20242f),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedIndex,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/Home.png'),
            ),
            backgroundColor: Color(0xfff20242f),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/streams.png'),
            ),
            label: 'Streams',
            backgroundColor: Color(0xfff20242f),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/message.png'),
            ),
            label: 'Messages',
            backgroundColor: Color(0xfff20242f),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/Notification.png'),
            ),
            label: 'Notifications',
            backgroundColor: Color(0xfff20242f),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/profile.png'),
            ),
            label: 'Profiles',
            backgroundColor: Color(0xfff20242f),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(top: 15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: HeaderCharacter,
                  size: 28,
                ),
              ),
              TextButton(
                onPressed: () => setState(() {
                  Navigator.pop(context);
                  // ReadJsonData();
                }),
                child: const Icon(
                  Icons.add,
                  color: HeaderCharacter,
                  size: 38,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, bottom: 24),
            child: const Text(
              'Messages',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.normal,
                  color: HeaderCharacter),
            ),
          ),
          Container(
            color: Colors.black,
            child: const SizedBox(
              height: 1,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(namePerson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 18, left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: Stack(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          namePerson[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              top: 45,
                              left: 42,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: HeaderCharacter, width: 2.5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          namePerson[index]['name'].toString(),
                          style: chacrater_name,
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Container(
            color: Colors.black,
            child: const SizedBox(
              height: 1,
            ),
          ),
          Container(
              height: 400,
              width: double.infinity,
              padding: const EdgeInsets.only(right: 10, left: 20),
              child: ListView(
                children: List.generate(
                    personMessages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      personMessages[index]
                                                          ['img']),
                                                  fit: BoxFit.cover)),
                                        ),
                                        personMessages[index]['num_mess']
                                                .toString()
                                                .isNotEmpty
                                            ? Positioned(
                                                top: 40,
                                                left: 39,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: Colors.pink,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: HeaderCharacter,
                                                        width: 1),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        '${personMessages[index]['num_mess']}'),
                                                  ),
                                                ),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${personMessages[index]['name']}',
                                            style: chacrater_mes,
                                          ),
                                          Text(
                                            '${personMessages[index]['created_at']}',
                                            style: hour_color,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.only(
                                            bottom: 20, top: 20),
                                        child: Text(
                                          '${personMessages[index]['message']}',
                                          style: chacrater_mes,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.black,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              150,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
              ))
        ],
      ),
    );
  }
}

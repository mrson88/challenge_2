import 'package:challenge_2/constants.dart';
import 'package:flutter/material.dart';
import 'package:challenge_2/data/full_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff20242f),
      body: getbody(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.stream),
              label: 'Streams',
              backgroundColor: navi_color),
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
        selectedItemColor: const Color(0xffff54b64),
      ),
    );
  }

  Widget getbody() {
    return SafeArea(
      child: Container(
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
                  onPressed: () => Navigator.pop(context),
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
              padding: EdgeInsets.only(left: 15, bottom: 24),
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
                    padding: EdgeInsets.only(top: 15, bottom: 18, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 9),
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
                padding: EdgeInsets.only(right: 20, left: 20),
                child: ListView(
                  children: List.generate(
                      personMessages.length,
                      (index) => Padding(
                            padding: EdgeInsets.only(left: 8, top: 20),
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
                                                  top: 35,
                                                  left: 32,
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.pink,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color:
                                                              HeaderCharacter,
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
                                  padding: EdgeInsets.only(right: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    width:
                                        MediaQuery.of(context).size.width - 130,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          padding: EdgeInsets.only(
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
      ),
    );
  }
}

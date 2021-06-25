import 'package:flash_shoes_flutter/screens/add_screen.dart';
import 'package:flash_shoes_flutter/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  // HomeScreen({});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> getData() async {
    var url =
        'http://192.168.0.117/flash_shoes_api/ambildata.php?email="triartainyoman@gmail.com"';
    try {
      var data = await http.get(Uri.parse(url));
      var jsonData = json.decode(data.body);
      // print(jsonData);
      return jsonData;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, right: 15.0),
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, AddScreen.id);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Roof Store", style: kTitleTextStyle),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Container(
                                color: kSecondaryColor,
                                padding: EdgeInsets.all(3.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Ink.image(
                                      image: NetworkImage(
                                        'https://www.w3schools.com/howto/img_avatar.png',
                                      ),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Text("All Shoes", style: kLabelTextStyle),
                SizedBox(height: 15.0),
                FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text("Loading data..."),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return DetailScreen(
                                      index: index,
                                      list: snapshot.data,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          snapshot.data[index]['image_url'],
                                          fit: BoxFit.cover,
                                          height: 110.0,
                                          width: 110.0,
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data[index]['nama'],
                                              style: kCardTitleTextStyle,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              "Rp. " +
                                                  snapshot.data[index]['harga'],
                                              style: kCardSubTitleTextStyle,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              "Stok Tersedia: " +
                                                  snapshot.data[index]['stok'],
                                              style: kCardSubTitleTextStyle,
                                            ),
                                            SizedBox(height: 15.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text("Detail",
                                                    style:
                                                        kCardSubTitleTextStyle),
                                                SizedBox(width: 5.0),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 14.0,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

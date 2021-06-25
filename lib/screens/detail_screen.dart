import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/reusable_back_button.dart';
import 'package:flash_shoes_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';
import 'package:http/http.dart' as http;

import 'edit_screen.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({@required this.index, @required this.list, this.email});

  List list;
  int index;
  final String email;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void hapusData() {
    try {
      var url = 'http://192.168.0.117/flash_shoes_api/hapusdata.php';
      http.post(Uri.parse(url), body: {
        "id": widget.list[widget.index]['id'],
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350.0,
                    color: kSecondaryColor,
                    child: Image.network(
                      widget.list[widget.index]['image_url'],
                      // fit: BoxFit.cover,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30.0),
                    child: Stack(
                      children: [
                        Center(
                          child: Text("Detail", style: kTitleTextStyle),
                        ),
                        ReusableBackButton(onTap: () {
                          Navigator.pop(context);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Kode: " + widget.list[widget.index]['kode']),
                    Text("Stok Tersedia: " + widget.list[widget.index]['stok']),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.list[widget.index]['nama'],
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Rp. " + widget.list[widget.index]['harga'],
                      style: kDetailLabelTextStyle,
                    ),
                    SizedBox(height: 60.0),
                    CustomButton(
                      text: 'Edit',
                      color: kPrimaryColor,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return EditScreen(
                            email: widget.email,
                            data: widget.list[widget.index],
                          );
                        }));
                      },
                    ),
                    SizedBox(height: 10.0),
                    CustomButton(
                      text: 'Hapus',
                      color: kDangerColor,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Hapus Data"),
                              content: Text("Yakin Ingin Menghapus Data?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("Batalkan"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: kDangerColor,
                                  ),
                                  onPressed: () {
                                    hapusData();
                                    // Navigator.pop(context);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return HomeScreen();
                                        },
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Data berhasil dihapus"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                                  child: Text("Hapus"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

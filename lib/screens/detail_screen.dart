import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/reusable_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({@required this.index, @required this.list});

  List list;
  int index;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                    ),
                    SizedBox(height: 10.0),
                    CustomButton(
                      text: 'Hapus',
                      color: kDangerColor,
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

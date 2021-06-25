import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/input_field.dart';
import 'package:flash_shoes_flutter/components/reusable_back_button.dart';
import 'package:flash_shoes_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';
import 'package:http/http.dart' as http;

class EditScreen extends StatefulWidget {
  static String id = 'edit_screen';
  final String email;
  final Map data;

  EditScreen({this.email, this.data});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerKode = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerStok = TextEditingController();
  TextEditingController controllerImageURL = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerKode.text = widget.data['kode'];
    controllerNama.text = widget.data['nama'];
    controllerHarga.text = widget.data['harga'];
    controllerStok.text = widget.data['stok'];
    controllerImageURL.text = widget.data['image_url'];
  }

  @override
  void dispose() {
    super.dispose();
    controllerKode.clear();
    controllerNama.clear();
    controllerHarga.clear();
    controllerStok.clear();
    controllerImageURL.clear();
  }

  void editData() {
    try {
      var url = 'http://192.168.0.117/flash_shoes_api/editdata.php';
      http.post(
        Uri.parse(url),
        body: {
          "id": widget.data['id'],
          "kodeBarang": controllerKode.text,
          "namaBarang": controllerNama.text,
          "hargaBarang": controllerHarga.text,
          "stokBarang": controllerStok.text,
          "imageURL": controllerImageURL.text,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("Edit data " + widget.email);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Text("Edit Data", style: kTitleTextStyle),
                      ),
                      ReusableBackButton(onTap: () {
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  // Kode
                  Text("Kode", style: kLabelTextStyle),
                  SizedBox(height: 10.0),
                  InputField(
                    controller: controllerKode,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  // Nama
                  Text("Nama", style: kLabelTextStyle),
                  SizedBox(height: 10.0),
                  InputField(
                    controller: controllerNama,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  // Harga
                  Text("Harga", style: kLabelTextStyle),
                  SizedBox(height: 10.0),
                  InputField(
                    controller: controllerHarga,
                    obscureText: false,
                    type: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  // Stok
                  Text("Stok", style: kLabelTextStyle),
                  SizedBox(height: 10.0),
                  InputField(
                    controller: controllerStok,
                    obscureText: false,
                    type: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  // Image URL
                  Text("Image URL", style: kLabelTextStyle),
                  SizedBox(height: 10.0),
                  Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: TextFormField(
                      controller: controllerImageURL,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                      style: kInputTextStyle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "field tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    color: kPrimaryColor,
                    text: 'Edit',
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        editData();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Data berhasil diubah"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return HomeScreen();
                        }));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

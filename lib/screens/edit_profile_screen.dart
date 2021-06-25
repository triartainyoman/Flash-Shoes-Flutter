import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/input_field.dart';
import 'package:flash_shoes_flutter/components/reusable_back_button.dart';
import 'package:flash_shoes_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  static String id = 'edit_profile_screen';
  final String email;
  final Map data;

  EditProfile({this.email, this.data});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerNamaUser = TextEditingController();
  TextEditingController controllerImageURL = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerNamaUser.text = widget.data['nama_user'];
    controllerImageURL.text = widget.data['profile_url'];
  }

  @override
  void dispose() {
    super.dispose();
    controllerNamaUser.clear();
    controllerImageURL.clear();
  }

  void editData() {
    try {
      var url =
          'http://192.168.0.117/flash_shoes_api/editUser.php?email="${widget.email}"';
      http.post(
        Uri.parse(url),
        body: {
          // "email": widget.email,
          "nama_user": controllerNamaUser.text,
          "profile_url": controllerImageURL.text,
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
                        child: Text("Profile", style: kTitleTextStyle),
                      ),
                      ReusableBackButton(onTap: () {
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  // Nama
                  Text("Nama", style: kLabelTextStyle),
                  SizedBox(height: 10.0),
                  InputField(
                    controller: controllerNamaUser,
                    obscureText: false,
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
                    text: 'Edit Profile',
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

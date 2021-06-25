import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/input_field.dart';
import 'package:flash_shoes_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerNamaUser = TextEditingController();
  TextEditingController controllerProfileURL = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void simpanUser() {
    try {
      var url = 'http://192.168.0.117/flash_shoes_api/addUser.php';
      http.post(Uri.parse(url), body: {
        "email": controllerEmail.text,
        "nama_user": controllerNamaUser.text,
        "profile_url": controllerProfileURL.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 100.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 150.0,
                    width: 101.0,
                  ),
                ),
                SizedBox(height: 60.0),
                Text("Email", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                InputField(
                  controller: controllerEmail,
                  type: TextInputType.emailAddress,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "field tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                Text("Password", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                InputField(
                  controller: controllerPassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "field tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                // Nama Toko
                Text("Nama Toko", style: kLabelTextStyle),
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
                // Profile URL
                Text("Profile URL", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    controller: controllerProfileURL,
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

                SizedBox(height: 35.0),
                CustomButton(
                  text: "Buat Akun",
                  onTap: () async {
                    // Navigator.pushNamed(context, HomeScreen.id);
                    if (_formKey.currentState.validate()) {
                      // print(controllerPassword.text);
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                          email: controllerEmail.text,
                          password: controllerPassword.text,
                        );
                        if (newUser != null) {
                          simpanUser();
                          Navigator.pushNamed(context, HomeScreen.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Akun berhasil dibuat"),
                              backgroundColor: kPrimaryColor,
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

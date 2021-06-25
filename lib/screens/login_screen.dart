import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/input_field.dart';
import 'package:flash_shoes_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final _auth = FirebaseAuth.instance;
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
                      return "Field tidak boleh kosong";
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
                      return "Field tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 35.0),
                CustomButton(
                  text: "Masuk",
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: controllerEmail.text,
                            password: controllerPassword.text);
                        if (user != null) {
                          // Navigator.pushNamed(context, HomeScreen.id);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return HomeScreen();
                          }));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Anda berhasil masuk"),
                              backgroundColor: kPrimaryColor,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Gagal masuk ke aplikasi"),
                              backgroundColor: Colors.red,
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

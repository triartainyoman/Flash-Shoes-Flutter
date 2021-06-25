import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/input_field.dart';
import 'package:flash_shoes_flutter/constants.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 100.0),
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
                obscureText: false,
              ),
              SizedBox(height: 20.0),
              Text("Password", style: kLabelTextStyle),
              SizedBox(height: 10.0),
              InputField(
                obscureText: true,
              ),
              SizedBox(height: 35.0),
              CustomButton(
                text: "Buat Akun",
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

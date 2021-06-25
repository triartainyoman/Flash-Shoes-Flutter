import 'package:flash_shoes_flutter/constants.dart';
import 'package:flash_shoes_flutter/screens/register_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = "welcome_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temukan sepatu impian\nAnda di Flash Shoes",
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 25.0),
                Text(
                  "Kami menyediakan banyak pilihan sepatu\nyang kekinian dari berbagai brand untuk\nsemua kalangan usia",
                  style: kRegularTextStyle,
                ),
                SizedBox(height: 25.0),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Container(
                        height: 45.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Center(
                          child: Text(
                            "Masuk",
                            style: kLabelTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: Container(
                        height: 45.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Center(
                          child: Text(
                            "Buat Akun",
                            style: kLabelTextStyle.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Image.asset('assets/illustration.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

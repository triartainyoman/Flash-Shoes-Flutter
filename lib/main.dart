import 'package:flash_shoes_flutter/screens/add_screen.dart';
import 'package:flash_shoes_flutter/screens/home_screen.dart';
import 'package:flash_shoes_flutter/screens/login_screen.dart';
import 'package:flash_shoes_flutter/screens/register_screen.dart';
import 'package:flash_shoes_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I Nyoman Triarta",
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AddScreen.id: (context) => AddScreen(),
      },
    );
  }
}

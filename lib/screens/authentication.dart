import 'package:bp_todo/screens/home-page.dart';
import 'package:bp_todo/screens/login-page.dart';
import 'package:bp_todo/screens/register-screen.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;


  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isToggle ? LoginScreen(toggleScreen: toggleScreen) : RegisterScreen(toggleScreen: toggleScreen);
  }
}

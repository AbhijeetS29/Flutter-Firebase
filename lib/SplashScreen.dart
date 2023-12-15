import 'dart:async';
import 'package:firstyy_y/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Adding a delay of 3 seconds before navigating to another screen
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen (replace 'Home()' with your desired screen)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyHomePage(title: 'Firs Flutter',)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}



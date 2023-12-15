import 'package:firstyy_y/ListWheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Book.dart';

class First extends StatefulWidget {
  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Centered title in the app bar
        title: Center(
          child: Text(
            "App Name", // Replace with your app name
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        automaticallyImplyLeading: false, // Hide back button
      ),
      body: ListView(

        children: [
          GestureDetector(
            onTap: () {
              // Add your action here when the container is tapped
              print('Container tapped!');
              // You can navigate to a new screen or perform any action here
              Navigator.push(context, MaterialPageRoute(builder: (context)=> List()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20 , right: 20), // Adding margin from top and left
              height: 100,
              width: 100,
              child: Center(child: Text("First Book")),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),GestureDetector(
            onTap: () {
              // Add your action here when the container is tapped
              print('Container tapped!');
              // You can navigate to a new screen or perform any action here
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BookPageTurnAnimation()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20), // Adding margin from top and left
              height: 100,
              width: 100,
              child: Center(child: Text("First Book")),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),GestureDetector(
            onTap: () {
              // Add your action here when the container is tapped
              print('Container tapped!');
              // You can navigate to a new screen or perform any action here
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20), // Adding margin from top and left
              height: 100,
              width: 100,

              child: Center(child: FaIcon(FontAwesomeIcons.amazonPay)),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),GestureDetector(
            onTap: () {
              // Add your action here when the container is tapped
              print('Container tapped!');
              // You can navigate to a new screen or perform any action here
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20), // Adding margin from top and left
              height: 100,
              width: 100,

              child: Center(child: FaIcon(FontAwesomeIcons.amazonPay)),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

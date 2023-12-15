import 'package:flutter/material.dart';

class List extends StatelessWidget {
  var texts = [
    "First Book",
    "Second Book",
    "Third Book","Third Book","Third Book","Third Book","Third Book",
    // Add more texts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListWheelScrollView(
          itemExtent: 100,
          children: texts.map((text) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

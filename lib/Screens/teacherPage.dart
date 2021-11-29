import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class teacherscreen extends StatefulWidget {
  @override
  _teacherscreenState createState() => _teacherscreenState();
}

class _teacherscreenState extends State<teacherscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body:Container(),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        animationDuration: Duration(milliseconds: 400),
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.event_available, size: 30),
          Icon(Icons.app_registration, size: 30),
          Icon(Icons.present_to_all, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),

    );
  }
}

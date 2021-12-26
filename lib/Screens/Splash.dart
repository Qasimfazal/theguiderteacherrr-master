import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/Data/attendance.dart';
import 'package:theguiderteacherrr/Screens/Login_.dart';
import 'package:intl/intl.dart';
import 'package:theguiderteacherrr/widget/Toast.dart';

import '../global.dart';

class Splashscreen extends StatefulWidget {

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  navigate() async {
    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    });
  }

  initi() async {
    Timer(
      Duration(seconds: 2),
      () {
        navigate();
      },
    );
  }
String msg;
  @override
  void initState() {
    initi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo8.jpeg'),
                ],
              ),
            ),
          ),
        ));
  }
}

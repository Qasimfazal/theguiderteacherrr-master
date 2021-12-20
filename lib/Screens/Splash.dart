import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/Screens/Login_.dart';
import 'package:intl/intl.dart';

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
      Duration(seconds: 3),
      () {
        navigate();
      },
    );
  }

  @override
  void initState() {
    initi();

    DateTime now = DateTime.now();
    String day = DateFormat('EEEE \n').format(now);
    String time = DateFormat('kk:mm').format(now);
    print(day);
    print(time);

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
                  Image.asset('assets/Alqurankareem.jpeg'),
                ],
              ),
            ),
          ),
        ));
  }
}

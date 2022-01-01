
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {

  final String titlee;
  final double barHeight = 60.0;

  GradientAppBar(this.titlee);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      decoration: BoxDecoration(
      gradient: LinearGradient(

          colors: [
            Color.fromRGBO(143, 148, 251, 1),
            Color.fromRGBO(143, 148, 251, .6),
          ],
          // colors: [Colors.red, Colors.blue],
          // begin: const FractionalOffset(0.0, 0.0),
          // end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
      ),
    ),
      child: Row(
        children: [
          Row(
            children: [
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                titlee,
                style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/Screens/CreateCource.dart';
import 'package:theguiderteacherrr/Screens/Meeting.dart';

class OnlineMadarsalist {
  var destination;
  var image;
  var navigation;

  OnlineMadarsalist ({
    @required this.destination,
    @required this.image,
    @required this.navigation,
  });
}

List<OnlineMadarsalist > madarsaList = [
  OnlineMadarsalist (
    destination: 'My Cources ',
    image: 'assets/OnlineMadarsa.jpeg',
    navigation: Meeting(),
  ),
  OnlineMadarsalist (
    destination: 'Create Cource',
    image: 'assets/Quran.jpeg',
    navigation: Create_Cource(),
  ),
  OnlineMadarsalist (
    destination: 'Attendance',
    image: 'assets/tilavat.jpeg',
    navigation: 'jhb',
  ),


];

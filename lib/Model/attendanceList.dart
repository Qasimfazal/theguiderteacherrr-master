import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Attendance_List{
  var Absent;
  var present;
  var Name;
  var Cource_Name;

  Attendance_List({
    @required this.Name,
    @required this.Cource_Name,
    @required this.Absent,
    @required this.present,
  });
}

List<Attendance_List > attendanceList = [
  Attendance_List (
   Name: 'Teacher Name',
   Cource_Name: 'XYZ',
      Absent:'00',
    present: '00',

  ),
  Attendance_List (
    Name: 'Teacher Name',
    Cource_Name: 'XYZ',
    Absent:'00',
    present: '00',
  ),
  Attendance_List (
    Name: 'Teacher Name',
    Cource_Name: 'XYZ',
    Absent:'00',
    present: '00',
  ),
];

import 'package:flutter/material.dart';
class StudentInClassModel{
  String studentid , studentname , absent , day , slottime , cid , tid , present , roomid;
  bool check;

  StudentInClassModel(this.studentid, this.studentname, this.absent ,this.check,
      this.day , this.slottime , this.cid , this.tid , this.present , this.roomid);
}
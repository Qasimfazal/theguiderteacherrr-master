import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theguiderteacherrr/Model/My_Cource_Model.dart';
import 'package:theguiderteacherrr/Model/StudentInClassModel.dart';
import 'package:theguiderteacherrr/Screens/StudentInCourses.dart';
import 'package:intl/intl.dart';

String Student_Absent;
String Student_Present;
String Student_Sid;
String Student_Cource_Id;
String S_sid;

List<MyCoursesModel> myCoursesList = [];
List<String> Student_CourceList = [];
List<String> studentSidList = [];
List<String> studentcourseList = [];
List<StudentInClassModel> studentInClassModelList1 = [];
List<StudentInClassModel> studentInClassModelList = [];
String Student_Name;

class Data {
  static Future<void> Retrieve_MyCourtses() async {
    myCoursesList.clear();
    Student_CourceList.clear();
    FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference DB_Refrance = await FirebaseDatabase.instance
        .reference()
        .child("courseSchedule")
        .child(auth.currentUser.uid);
    DB_Refrance.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      Iterable childkey1 = values.keys;
      childkey1.forEach((element) {
        Student_CourceList.add(element);
      });
    }).then((value) async {
      await fetchFurtherDetails();
    });
  }
  static Future<void> fetchFurtherDetails() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    for (int res = 0; res < Student_CourceList.length; res++) {
      DatabaseReference DB_Reference1 = await FirebaseDatabase.instance
          .reference()
          .child("courseSchedule")
          .child(auth.currentUser.uid)
          .child(Student_CourceList.elementAt(res).toString());
      DB_Reference1.once().then((DataSnapshot snapshot) {
        String RoomID = snapshot.value['RoomID'];
        String Courcename = snapshot.value['Courcename'];
        String Teacher_Uid = snapshot.value['Teacher_Uid'];
        String SlotNo = snapshot.value['SlotNo'];
        String SlotTime = snapshot.value['SlotTime'];
        String Absents = snapshot.value['Absents'];
        String Cid = snapshot.key;
        String Day = snapshot.value['Day'];
        String StudentStrength = snapshot.value['StudentStrength'];
        String present = snapshot.value['Present'];
        String Sname = snapshot.value['Name'];
        MyCoursesModel mcm = new MyCoursesModel(
          RoomID,
          Courcename,
          Cid,
          Teacher_Uid,
          SlotNo,
          SlotTime,
          Absents,
          Day,
          StudentStrength,
          present,
          Sname,
        );
        myCoursesList.add(mcm);
      });
    }
  }

  static void retrieveStudent(String cid, BuildContext context) async {
    studentcourseList.clear();
    studentSidList.clear();
    studentInClassModelList.clear();
    studentInClassModelList1.clear();
    DatabaseReference reff =
        await FirebaseDatabase.instance.reference().child("StudentCourse");
    reff.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      Iterable childkey1 = values.keys;
      childkey1.forEach((element) {
        studentSidList.add(element);
      });
    }).then((value) async {
      await retrieveStudentInCourses(cid, context);
    });
  }

  static Future<void> retrieveCoursesDetails(String cid, BuildContext context) async {
    for (int i = 0; i < studentSidList.length; i++) {
      DatabaseReference datareff = await FirebaseDatabase.instance
          .reference()
          .child("StudentCourse")
          .child(studentSidList.elementAt(i));
      datareff.once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        Iterable childkey1 = values.keys;
        childkey1.forEach((element) {

          studentcourseList.add(element);
        });
      }).then((value) async {
        studentInClassModelList.clear();
        await StudentInRespectiveClass(cid, context);
      });
    }
  }

  static Future<void> StudentInRespectiveClass(String cid, BuildContext context) async {

    for (int res = 0; res < studentSidList.length; res++) {

      for (int i = 0; i < studentcourseList.length; i++) {
        DatabaseReference reference = await FirebaseDatabase.instance
            .reference()
            .child("StudentCourse")
            .child(studentSidList.elementAt(res))
            .child(studentcourseList.elementAt(i));
        reference.once().then((DataSnapshot snapshot) {
          if (cid == snapshot.key) {
            String _cid = snapshot.key;
            String _sid = studentSidList.elementAt(res);
            String _absent = snapshot.value['Absents'];
            String _day = snapshot.value["Day"];
            String _slottime = snapshot.value["SlotTime"];
            String _tid = snapshot.value["Teacher_Uid"];
            String _present = snapshot.value["Present"];
            String _sname = snapshot.value["Name"];
            String _roomId = snapshot.value["RoomID"];

            StudentInClassModel sicm = new StudentInClassModel(_sid, _sname,

                _absent,true, _day, _slottime, _cid, _tid, _present, _roomId);

              studentInClassModelList.add(sicm);

          }
        });
        /*then((value) async {
          await NavigateToScreen(context);
        });*/
      }

    }
    Future.delayed(Duration(seconds: 35), () {

        NavigateToScreen(context);

    });

  }

  static void MoveTowardsAttendance() {
    DateTime now = DateTime.now();
    String day = DateFormat('EEEE').format(now);
    String time = DateFormat('kk:mm').format(now);
    for (int i = 0; i < studentInClassModelList.length; i++) {
      if (studentInClassModelList[i].day == day) {
        S_sid = studentInClassModelList.elementAt(i).studentid;
        String _cid = studentInClassModelList.elementAt(i).cid;
        String _rid = studentInClassModelList.elementAt(i).roomid;

        MarkAttendance("RoomAttendance", _rid, S_sid, _cid, i);
        //   }
      }else{
        Fluttertoast.showToast(
            msg: 'Attendance Will be Mark on Class Day',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  static Future<void> MarkAttendance(
      String nodeName, rid, sid, cid, int index) async {
    DatabaseReference refer = await FirebaseDatabase.instance
        .reference()
        .child("StudentCourse")
        .child(sid)
        .child(cid);

    Map<String, Object> createDocStudentCourse = new HashMap();
    createDocStudentCourse['Absents'] =
        studentInClassModelList.elementAt(index).absent;
    createDocStudentCourse['Present'] =
        studentInClassModelList.elementAt(index).present;
    refer.update(createDocStudentCourse).then((value) async {
      await UpdateRoom(nodeName, rid, sid, index);
    });
  }

  static NavigateToScreen(BuildContext context) {
    if (studentInClassModelList.isNotEmpty) {

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => StudentInCourse()));
    } else {
      Fluttertoast.showToast(
          msg: 'No Student in this cours',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static Future<void> UpdateRoom(String nodeName, rid, sid, int index) async {
    DatabaseReference reff = await FirebaseDatabase.instance
        .reference()
        .child(nodeName)
        .child(rid)
        .child(sid);
    Map<String, Object> createDoc = new HashMap();
    createDoc['Absent'] = studentInClassModelList.elementAt(index).absent;
    createDoc['Present'] = studentInClassModelList.elementAt(index).present;
    createDoc['Cid'] = studentInClassModelList.elementAt(index).cid;
    createDoc['StudentName'] =
        studentInClassModelList.elementAt(index).studentname;

    reff.update(createDoc).whenComplete(() {
      Fluttertoast.showToast(
          msg: 'Attendance marked',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  static retrieveStudentInCourses(String cid, BuildContext context) async {
    for(int i =0 ; i<studentSidList.length ; i++) {
      DatabaseReference reference = await FirebaseDatabase.instance.reference().child("StudentCourse").child(studentSidList.elementAt(i)).child(cid);
      reference.once().then((DataSnapshot snapshot) {
        String _cid = snapshot.key;
        String _sid = studentSidList.elementAt(i);
        String _absent = snapshot.value['Absents'];
        String _day = snapshot.value["Day"];
        String _slottime = snapshot.value["SlotTime"];
        String _tid = snapshot.value["Teacher_Uid"];
        String _present = snapshot.value["Present"];
        String _sname = snapshot.value["Name"];
        String _roomId = snapshot.value["RoomID"];

        StudentInClassModel sicm = new StudentInClassModel(_sid, _sname,

            _absent,true, _day, _slottime, _cid, _tid, _present, _roomId);

        studentInClassModelList.add(sicm);
        NavigateToScreen(context);
      });

    }
  }


}

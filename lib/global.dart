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



List<MyCoursesModel> myCoursesList = new List<MyCoursesModel>();
List<String> Student_CourceList = new List<String>();
List<String> studentSidList = new  List<String>();
List<String> studentcourseList = new  List<String>();
List<StudentInClassModel> studentAttendancelist = new List<StudentInClassModel>();
List<StudentInClassModel> studentInClassModelList = new List<StudentInClassModel>();

void Retrieve_MyCourtses() {
   myCoursesList.clear();
  Student_CourceList.clear();
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference DB_Refrance = FirebaseDatabase.instance.reference().child(
      "courseSchedule").child(auth.currentUser.uid);
  DB_Refrance.once().then((DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value;
    Iterable childkey1 = values.keys;
    childkey1.forEach((element) {
      Student_CourceList.add(element);
    });



  });
  Future.delayed(Duration(seconds: 3), () {
    for (int res = 0; res < Student_CourceList.length; res++) {
      DatabaseReference DB_Reference1 =
      FirebaseDatabase.instance.reference().child("courseSchedule").child(
          auth.currentUser.uid).child(
          Student_CourceList.elementAt(res).toString());
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
        MyCoursesModel mcm = new MyCoursesModel(
            RoomID,
            Courcename,
            Cid,
            Teacher_Uid,
            SlotNo,
            SlotTime,
            Absents,
            Day,
            StudentStrength);
        myCoursesList.add(mcm);
      });
    }
  });

}
void retrieveStudent(String cid ,  BuildContext context ){
  FirebaseDatabase.instance.reference().child("StudentCourse").once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      Iterable childkey1 = values.keys;
      childkey1.forEach((element) {
        studentSidList.add(element);
      });
  });
  Future.delayed(Duration(seconds: 5), () {
   for(int i =0; i<studentSidList.length ; i++){
     FirebaseDatabase.instance.reference().child("StudentCourse").child(studentSidList.elementAt(i)).once().then((DataSnapshot snapshot){
       Map<dynamic, dynamic> values = snapshot.value;
       Iterable childkey1 = values.keys;
       childkey1.forEach((element) {
         /*if(cid==element) {
           FirebaseDatabase.instance.reference().child("StudentCourse").child(
               studentSidList.elementAt(i)).child(element).once().then((
               DataSnapshot snapshot) {
               String _sid = studentSidList.elementAt(i);
               String _cid = snapshot.key;
               String _absent = snapshot.value['Absents'];
               String _day = snapshot.value["Day"];
               String _slottime = snapshot.value["SlotTime"];
               String _tid = snapshot.value["Teacher_Uid"];
               String _present = snapshot.value["Present"];
               FirebaseDatabase.instance.reference().child("UserClient").child(
                   _sid).once()
                   .then((DataSnapshot dataSnapshot) {
                 String _sname = dataSnapshot.value["Name"];
                 StudentInClassModel sicm = new StudentInClassModel(
                     _sid, _sname, _absent, _day ,_slottime , _cid , _tid , _present);
                 studentInClassModelList.add(sicm);
               });
           });
         }*/
         studentcourseList.add(element);
       });
     });

   }
  });

  Future.delayed(Duration(seconds: 3), () {
    for(int res = 0; res<studentSidList.length; res++) {
      for (int i = 0; i < studentcourseList.length; i++) {
        FirebaseDatabase.instance.reference().child("StudentCourse").child(
            studentSidList.elementAt(res)).child(studentcourseList.elementAt(i)).once().then((DataSnapshot snapshot) {
              if(cid==snapshot.key){
                String _cid = snapshot.key;
                String _sid = studentSidList.elementAt(res);
                String _absent = snapshot.value['Absents'];
                String _day = snapshot.value["Day"];
                String _slottime = snapshot.value["SlotTime"];
                String _tid = snapshot.value["Teacher_Uid"];
                String _present = snapshot.value["Present"];
                FirebaseDatabase.instance.reference().child("UserClient").child(_sid).once()
                .then((DataSnapshot dataSnapshot){
                  String _sname =dataSnapshot.value["Name"];
                  StudentInClassModel sicm = new StudentInClassModel(
                      _sid, _sname, _absent, _day ,_slottime , _cid , _tid , _present);
                  studentInClassModelList.add(sicm);

                });
              }
        });
      }
      if(res==(studentSidList.length-1)){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => StudentInCourse()));
      }
    }
  });
  }
  void MoveTowardsAttendance(){
    DateTime now = DateTime.now();
    String day = DateFormat('EEEE').format(now);
    String time = DateFormat('kk:mm').format(now);
    for(int i=0; i<studentInClassModelList.length ; i++){
      if(studentInClassModelList[i].day == day){
        if(studentInClassModelList.elementAt(i).slottime == time){
          String _sid = studentInClassModelList.elementAt(i).studentid;
          String _cid = studentInClassModelList.elementAt(i).cid;
          MarkAttendance("StudentCourse", _sid, _cid, i);
        }
      }
    }
  }
  void MarkAttendance(String nodeName , sid , cid ,int index) {
    DatabaseReference reff = FirebaseDatabase.instance.reference().child(nodeName).child(sid).child(cid);
    Map<String, Object> createDoc = new HashMap();
    createDoc['Absent'] = studentInClassModelList.elementAt(index).absent;
    createDoc['Present'] = studentInClassModelList.elementAt(index).present;
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


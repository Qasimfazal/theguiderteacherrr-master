// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:theguiderteacherrr/Model/My_Cource_Model.dart';
//
//
//
// class Retrive{
//   List<MyCoursesModel2> myCoursesList2 = [];
//   List<String> Student_CourceList2 = [];
//    getStudent() {
//     myCoursesList2.clear();
//     Student_CourceList2.clear();
//     FirebaseAuth auth = FirebaseAuth.instance;
//     DatabaseReference DB_Refrance = FirebaseDatabase.instance
//         .reference()
//         .child("courseSchedule")
//         .child(auth.currentUser.uid);
//     DB_Refrance.once().then((DataSnapshot snapshot) {
//       Map<dynamic, dynamic> values = snapshot.value;
//       Iterable childkey1 = values.keys;
//       childkey1.forEach((element) {
//         Student_CourceList2.add(element);
//       });
//     });
//
//     Future.delayed(Duration(seconds: 4), () {
//       for (int res = 0; res < Student_CourceList2.length; res++) {
//         DatabaseReference DB_Reference1 = FirebaseDatabase.instance
//             .reference()
//             .child("courseSchedule")
//             .child(auth.currentUser.uid)
//             .child(Student_CourceList2.elementAt(res).toString());
//         DB_Reference1.once().then((DataSnapshot snapshot) {
//           String RoomID = snapshot.value['RoomID'];
//           String Courcename = snapshot.value['Courcename'];
//           String Teacher_Uid = snapshot.value['Teacher_Uid'];
//           String SlotNo = snapshot.value['SlotNo'];
//           String SlotTime = snapshot.value['SlotTime'];
//           String Absents = snapshot.value['Absents'];
//           String Cid = snapshot.key;
//           String Day = snapshot.value['Day'];
//           String StudentStrength = snapshot.value['StudentStrength'];
//           String present = snapshot.value['Present'];
//           String Sname = snapshot.value['Name'];
//           // MyCoursesModel mcm = new MyCoursesModel(
//           //   RoomID,
//           //   Courcename,
//           //   Cid,
//           //   Teacher_Uid,
//           //   SlotNo,
//           //   SlotTime,
//           //   Absents,
//           //   Day,
//           //   StudentStrength,
//           //   present,
//           //   Sname,
//           // );
//           // myCoursesList2.add(mcm);
//
//           myCoursesList2.add(MyCoursesModel2(
//               RoomID,
//               Courcename,
//               cid,
//               Teacher_Uid,
//               SlotNo,
//               SlotTime,
//               Absents,
//               Day,
//               StudentStrength, present, Sname))
//         });
//       }
//     });
//   }
//
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:theguiderteacherrr/Model/DataModel.dart';

List<MyCoursesModel2> myCoursesList2 = [];
List<String> Student_CourceList2 = [];
List<String> IdList = [];
class DataRetrive {
  static void Retrieve() async {
    var value;
    print("sorry");
    myCoursesList2.clear();
    Student_CourceList2.clear();
    FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference DB_Refrance = await FirebaseDatabase.instance
        .reference()
        .child("courseSchedule")
        .child(auth.currentUser.uid);
    DB_Refrance.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      Iterable childkey1 = values.keys;
      childkey1.forEach((element) {
        Student_CourceList2.add(element);

        print(IdList);
      });


    }).then((value) async {
      await datacalling();
    });
  }

  static void datacalling() async {
    myCoursesList2.clear();
    FirebaseAuth auth = FirebaseAuth.instance;
    for (int res = 0; res < Student_CourceList2.length; res++) {

      DatabaseReference DB_Reference1 = await FirebaseDatabase.instance
          .reference()
          .child("courseSchedule")
          .child(auth.currentUser.uid)
          .child(Student_CourceList2.elementAt(res).toString());
      await DB_Reference1.once().then((DataSnapshot snapshot) {
        // value = snapshot;
        myCoursesList2.add(MyCoursesModel2(
          RoomID: snapshot.value['RoomID'],
          Courcename: snapshot.value['Courcename'],
          cid: snapshot.key,
          Teacher_Uid: snapshot.value['Teacher_Uid'],
          SlotNo: snapshot.value['SlotNo'],
          SlotTime: snapshot.value['SlotTime'],
          Absents: snapshot.value['Absents'],
          Day: snapshot.value['Day'],
          StudentStrength: snapshot.value['StudentStrength'],
          Present: snapshot.value['Present'],
          Sname:snapshot.value['Name'],

        ));
      });


    }
  }
}

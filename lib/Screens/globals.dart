// TODO Implement this library.

import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:theguiderteacherrr/Model/Cource_Shedule_Model.dart';
import 'package:theguiderteacherrr/Model/Cource_Shedule_Model.dart';
import 'package:theguiderteacherrr/Model/Cource_Shedule_Model.dart';

import 'globals.dart' as globals;


class randomClass {
  String RandomNumber ='';
  void Random_Generator(){

    RandomNumber = Random().nextInt(100000).toString();
   // print(Text("NUmber is"+RandomNumber));
  }
}

String STD_Db_StartHour;
String STD_Db_Minutes;
String STD_Db_RoomId;
String STD_Db_StudentStrength;
String STD_Db_TeacherUid;
String STD_Db_CourceDuration;

List<String> Allteachers_Uid = new List<String>();
List<String> Allteachers_Cource_Detail = new List<String>();
List<Cource_Shedule_Model> Allteachers_Declared_variables = new List<Cource_Shedule_Model>();

void Retrive_all_teachers_Classes() {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference DB_Refrance =
  FirebaseDatabase.instance.reference().child("courseSchedule");
  DB_Refrance.once().then((DataSnapshot snapshot) {

    String keys = snapshot.key;
    Map<dynamic, dynamic> value = snapshot.value;
    Iterable childkey1 = value.keys;
    childkey1.forEach((element) {
      Allteachers_Uid.add(element);
      for (int i = 0; i < Allteachers_Uid.length; i++) {
        DatabaseReference DB_Refrance2 = FirebaseDatabase.instance.reference().child("courseSchedule").child(Allteachers_Uid.elementAt(i).toString());
        DB_Refrance2.once().then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> value = snapshot.value;
          Iterable childkey2 = value.keys;
          childkey2.forEach((element) {
            Allteachers_Cource_Detail.add(element);
            for (int j = 0; j < Allteachers_Cource_Detail.length; j++) {
              DatabaseReference DB_Refrance3 = FirebaseDatabase.instance.reference().child("courseSchedule").child(Allteachers_Uid.elementAt(i).toString()).child(Allteachers_Cource_Detail.elementAt(j));
              DB_Refrance3.once().then((DataSnapshot snapshot) {
                String courcename = snapshot.value["Courcename"];
                String day = snapshot.value["Day"];
                String roomId = snapshot.value["RoomID"];
                String slotno = snapshot.value["SlotNo"];
                String slottime = snapshot.value["SlotTime"];
                String strength = snapshot.value["StudentStrength"];
                String tuid = snapshot.value["Teacher_Uid"];

                Cource_Shedule_Model cm = new  Cource_Shedule_Model(courcename , day ,roomId ,slotno ,slottime ,strength , tuid);
                Allteachers_Declared_variables.add(cm);

              });
            }
          });
        });
      }
    });
  });
}


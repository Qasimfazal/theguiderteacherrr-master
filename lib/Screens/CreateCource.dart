import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:theguiderteacherrr/Model/Cource_Shedule_Model.dart';
import 'package:theguiderteacherrr/widget/fadedanimation.dart';

class Create_Cource extends StatefulWidget {
  //const Create_Cource({Key? key}) : super(key: key);

  @override
  _Create_CourceState createState() => _Create_CourceState();
}

class _Create_CourceState extends State<Create_Cource> {

  final dbREF = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String Courcename, Hours, Min, CourceTimeDuration, TeacherUid, courseduration;
  TextEditingController _Cource_Name, _Teacher_Uid;
  List<String> Allteachers_Uid = new List<String>();
  List<bool> statelist = new List<bool>();
  List<String> Allteachers_Cource_Detail = new List<String>();
  List<Cource_Shedule_Model> Allteachers_Declared_variables = new List<Cource_Shedule_Model>();
  void initState() {
    super.initState();

    Random_Generator();
    statelist = new List<bool>();
    Allteachers_Uid = new List<String>();
    Allteachers_Cource_Detail = new List<String>();
    Allteachers_Declared_variables= new List<Cource_Shedule_Model>();
    _Cource_Name = new TextEditingController();
    _Teacher_Uid = new TextEditingController();
    //  _is24HourTime = new TextEditingController();
  }
  void Retrive_all_teachers_Classes() {
    FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference DB_Refrance =
    FirebaseDatabase.instance.reference().child("courseSchedule");
    DB_Refrance.once().then((DataSnapshot snapshot) {
      if(!snapshot.exists){
        inputData();
      }
      else {
        String keys = snapshot.key;
        Map<dynamic, dynamic> value = snapshot.value;
        Iterable childkey1 = value.keys;
        childkey1.forEach((element) {
          Allteachers_Uid.add(element);
          for (int i = 0; i < Allteachers_Uid.length; i++) {
            DatabaseReference DB_Refrance2 = FirebaseDatabase.instance
                .reference().child("courseSchedule").child(
                Allteachers_Uid.elementAt(i).toString());
            DB_Refrance2.once().then((DataSnapshot snapshot) {
              Map<dynamic, dynamic> value = snapshot.value;
              Iterable childkey2 = value.keys;
              childkey2.forEach((element) {
                Allteachers_Cource_Detail.add(element);
                for (int j = 0; j < Allteachers_Cource_Detail.length; j++) {
                  DatabaseReference DB_Refrance3 = FirebaseDatabase.instance.reference().child("courseSchedule").child(Allteachers_Uid
                      .elementAt(i).toString()).child(Allteachers_Cource_Detail
                      .elementAt(j));
                  DB_Refrance3.once().then((DataSnapshot snapshot) {
                    String courcename = snapshot.value["Courcename"];
                    String day = snapshot.value["Day"];
                    String roomId = snapshot.value["RoomID"];
                    String slotno = snapshot.value["SlotNo"];
                    String slottime = snapshot.value["SlotTime"];
                    String strength = snapshot.value["StudentStrength"];
                    String tuid = snapshot.value["Teacher_Uid"];

                    Cource_Shedule_Model cm = new Cource_Shedule_Model(
                        courcename,
                        day,
                        roomId,
                        slotno,
                        slottime,
                        strength,
                        tuid);
                    Allteachers_Declared_variables.add(cm);
                  });
                }
              });
            });
          }
          Future.delayed(Duration(seconds: 5),(){
            for(int res =0; res<Allteachers_Declared_variables.length; res++){
              String select_days = Select_Day;
              String slot_time = _course_duration;
              if(Allteachers_Declared_variables.elementAt(res).SlotTime == slot_time && Allteachers_Declared_variables.elementAt(res).Day==select_days){
                statelist.add(true);
              }
              else{
                statelist.add(false);

              }
            }

          });
          Future.delayed(Duration(seconds: 5),(){
            if(statelist.contains(true)){
              Fluttertoast.showToast(
                  msg: 'Clash in Class',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              statelist = new List<bool>();
              Allteachers_Uid = new List<String>();
              Allteachers_Cource_Detail = new List<String>();
              Allteachers_Declared_variables= new List<Cource_Shedule_Model>();
            }
            else{
              inputData();
              statelist = new List<bool>();
              Allteachers_Uid = new List<String>();
              Allteachers_Cource_Detail = new List<String>();
              Allteachers_Declared_variables= new List<Cource_Shedule_Model>();
            }
          });
        });
      }
    });
  }
  String RandomNumber ='';
  void Random_Generator(){

    RandomNumber = Random().nextInt(100000).toString();
    print(Text("NUmber is"+RandomNumber));
  }
  void inputData() {
    String cname = _Cource_Name.text;
    String selectdays = Select_Day;
    String slot = _course_duration;
    String uid = auth.currentUser.uid;
    String Student_Strength = Select_Student_Strength;
    String slotno ="";
    if(slot=="8:00"){
      slotno ="1";

    }
    else if(slot=="9:00"){
      slotno = "2";
    }
    else if(slot == "10:00"){
      slotno="3";
    }
    else if(slot =="11:00"){
      slotno = "4";
    }
    else if(slot =="12:00"){
      slotno="5";
    }

    DatabaseReference reff = FirebaseDatabase.instance
        .reference()
        .child("courseSchedule")
        .child(uid);
    reff.push().set({
      'RoomID' : RandomNumber,
      'Courcename': cname,
      'Teacher_Uid': uid,
      'SlotNo': slotno,
      'SlotTime':slot,
      'Day':selectdays,
      'StudentStrength': Student_Strength,
    }).whenComplete((){
      Fluttertoast.showToast(
          msg: 'Sucessfully Created',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    });
    // here you write the codes to input the data into firestore
  }
  String _Hours = 'Select Hours';
  String _Min = 'Select Minutes';
  String UserFinalHour;
  String UserFinalMin;
  String FinalDBHrs;
  String FinalDBMin;
  String _course_duration = 'Select Course Duration';
  String Select_Student_Strength = 'Select Student Strength';
  String Select_Day = 'Select Day';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/light-1.png'))),
                          )),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png'))),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png'))),
                        ),
                      ),
                      Positioned(
                          top: 30,
                          left: 30,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_sharp,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  //   Text('Teacher Portal',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w300),)
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Create Course',style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.w300),),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Room ID ' +RandomNumber,style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'Cource name Is Required'),
                                    ]),
                                    controller: _Cource_Name,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Cource name",
                                        hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width / 1.3,
                                    child: DropdownButtonFormField<String>(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        iconSize: 17,
                                        elevation: 16,
                                        style: TextStyle(color: Colors.grey),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle:
                                          TextStyle(color: Colors.grey[800]),
                                        ),
                                        value: _course_duration,
                                        items: <String>[
                                          'Select Course Duration',
                                          '8:00',
                                          '9:00',
                                          '10:00',
                                          '11:00',
                                          '12:00',
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            _course_duration = newVal;
                                          });
                                        }),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField<String>(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      iconSize: 17,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.grey),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                      ),
                                      value: Select_Student_Strength,
                                      items: <String>[
                                        'Select Student Strength',
                                        '10',
                                        '15',
                                        '30',
                                      ].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) {
                                        setState(() {
                                          Select_Student_Strength = newVal;
                                        });
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField<String>(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      iconSize: 17,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.grey),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                      ),
                                      value: Select_Day,
                                      items: <String>[
                                        'Select Day',
                                        'Monday',
                                        'Tuesday',
                                        'Wednesday',
                                        'Thursday',
                                        'Friday',
                                      ].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) {
                                        setState(() {
                                          Select_Day = newVal;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          2,
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                Retrive_all_teachers_Classes();

                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "Create Cource",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

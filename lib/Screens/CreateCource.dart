import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:theguiderteacherrr/widget/fadedanimation.dart';
import 'package:theguiderteacherrr/Config.dart';
import 'globals.dart' as globals;

class AddCource extends StatefulWidget {
  //const AddCource({Key? key}) : super(key: key);

  @override
  _AddCourceState createState() => _AddCourceState();
}

class _AddCourceState extends State<AddCource> {
  @override
  int hrs = 0;
  int time = 0;

  final dbREF = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String Courcename, Hours, Min, CourceTimeDuration, TeacherUid, courseduration;
  TextEditingController _Cource_Name, _Teacher_Uid;

  void initState() {
    super.initState();

    Random_Generator();
    _Cource_Name = new TextEditingController();
    _Teacher_Uid = new TextEditingController();
    //  _is24HourTime = new TextEditingController();
  }
  String RandomNumber ='';
  void Random_Generator(){

    RandomNumber = Random().nextInt(100000).toString();
    print(Text("NUmber is"+RandomNumber));
  }

  void inputData() {
    String cname = _Cource_Name.text;
    String hrs = _Hours;
    String min = _Min;
    String duration = _course_duration;
    String uid = auth.currentUser.uid;
    String Student_Strength = Select_Student_Strength;
    DatabaseReference reff = FirebaseDatabase.instance
        .reference()
        .child("courseSchedule")
        .child(uid);
    reff.push().set({
      'Room ID' : RandomNumber,
      'Courcename': cname,
      'Hours': hrs,
      'Minutes': min,
      'Teacher_Uid': uid,
      'courceDuration': duration,
      'Student Strength': Student_Strength,
    }).whenComplete(() {
      Fluttertoast.showToast(
          msg: 'Sucessfully Created',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
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

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
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
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Create \nCource",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
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
                                Text('Room ID ' +RandomNumber,style: TextStyle(fontWeight: FontWeight.bold),),
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
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.7,
                                      child: DropdownButtonFormField<String>(
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          iconSize: 17,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.grey),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800]),
                                            hintText: "Select Class Hours",
                                          ),
                                          value: _Hours,
                                          items: <String>[
                                            'Select Hours',
                                            '01',
                                            '02',
                                            '03',
                                            '04',
                                            '05',
                                            '06',
                                            '07',
                                            '08',
                                            '09',
                                            '10',
                                            '11',
                                            '12',
                                            '13',
                                            '14',
                                            '15',
                                            '16',
                                            '17',
                                            '18',
                                            '19',
                                            '20',
                                            '21',
                                            '22',
                                            '23'
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (newVal) {
                                            setState(() {
                                              _Hours = newVal;
                                            });
                                          }),
                                    ), //Hours
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.6,
                                      child: DropdownButtonFormField<String>(
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          iconSize: 17,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.grey),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800]),
                                            hintText: "Select Class Hours",
                                          ),
                                          value: _Min,
                                          items: <String>[
                                            'Select Minutes',
                                            '00',
                                            '01',
                                            '02',
                                            '03',
                                            '04',
                                            '05',
                                            '06',
                                            '07',
                                            '08',
                                            '09',
                                            '10',
                                            '11',
                                            '12',
                                            '13',
                                            '14',
                                            '15',
                                            '16',
                                            '17',
                                            '18',
                                            '19',
                                            '20',
                                            '21',
                                            '22',
                                            '23',
                                            '24',
                                            '25',
                                            '26',
                                            '27',
                                            '28',
                                            '29',
                                            '30',
                                            '31',
                                            '32',
                                            '33',
                                            '34',
                                            '35',
                                            '36',
                                            '37',
                                            '38',
                                            '39',
                                            '40',
                                            '41',
                                            '42',
                                            '43',
                                            '44',
                                            '45',
                                            '46',
                                            '47',
                                            '48',
                                            '49',
                                            '50',
                                            '51',
                                            '52',
                                            '53',
                                            '54',
                                            '55',
                                            '56',
                                            '57',
                                            '58',
                                            '59',
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (newVal) {
                                            setState(() {
                                              _Min = newVal;
                                            });
                                          }),
                                    ),
                                    //Minutes
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Class Start Timing " +
                                        _Hours +
                                        ' : ' +
                                        _Min,
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                                Container(
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
                                        '20',
                                        '25',
                                        '30',
                                        '35',
                                        '40',
                                        '45',
                                        '50',
                                        '55',
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Class Total Duration " +
                                        '00' +
                                        ' : ' +
                                        _course_duration,
                                    style: TextStyle(color: Colors.grey[400]),
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
                                )
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
                                RetrieveData();
                                //inputData();
                                // Navigator.pop(context);
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

  void RetrieveData() {
    List<String> childkeyslist = new List<String>();
    FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference databaseRef = FirebaseDatabase.instance.reference().child("courseSchedule").child(auth.currentUser.uid);
    databaseRef.once().then((DataSnapshot snapshot) {
      String keys = snapshot.key;
      if (keys == auth.currentUser.uid) {
        Map<dynamic, dynamic> value = snapshot.value;
        Iterable childkey = value.keys;
        childkey.forEach((element) {
          childkeyslist.add(element);
          for (int i = 0; i < childkeyslist.length; i++) {
            DatabaseReference reff = FirebaseDatabase.instance
                .reference()
                .child("courseSchedule")
                .child(auth.currentUser.uid)
                .child(childkeyslist.elementAt(i));
            reff.once().then((DataSnapshot dataSnapshot) {
              String DBcname = dataSnapshot.value['Courcename'];
              String DBhour = dataSnapshot.value['Hours'];
              String DBminute = dataSnapshot.value['Minutes'];
              String DB_cduration = dataSnapshot.value['courceDuration'];
              String USER_cname = _Cource_Name.text;
              String USER_hour = _Hours;
              String USER_minute = _Min;
              String USER_cduration = _course_duration;
              int MatMin = int.parse(USER_minute);

              if (DBhour == USER_hour && DBminute == USER_minute) {
                Fluttertoast.showToast(
                    msg: 'Clash in Class',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                int a = int.parse(USER_minute);
                int b = int.parse(USER_cduration);

                a = a + b;
                if (a >= 60) {
                  hrs = int.parse(USER_hour);
                  a = a - 60;
                  hrs++;
                  USER_hour = hrs.toString();
                  USER_minute = a.toString();
                  int _hrs = int.parse(DBhour);
                  if (hrs <= _hrs) {
                    int _mins = int.parse(DBminute);
                    if (a < _mins) {
                      int aa = int.parse(DBminute);
                      int bb = int.parse(DB_cduration);
                      aa = aa + bb;
                      hrs = int.parse(DBhour);
                      if (aa > 60) {
                        hrs++;
                        aa = aa - 60;
                        FinalDBHrs = hrs.toString();
                        FinalDBMin = aa.toString();
                      } else {
                        FinalDBHrs = hrs.toString();
                        FinalDBMin = aa.toString();
                      }
                      int userA = int.parse(USER_minute);
                      int userB = int.parse(USER_cduration);
                      userA = userA + userB;
                      hrs = int.parse(USER_hour);
                      if (userA > 60) {
                        hrs++;
                        userA = userA - 60;
                        UserFinalHour = hrs.toString();
                        UserFinalMin = userA.toString();
                      } else {
                        UserFinalHour = hrs.toString();
                        UserFinalMin = userA.toString();
                      }
                      if (USER_hour == DBhour) {
                        int db_init_minutes = int.parse(DBminute);
                        int user_init_minutes = int.parse(USER_minute);
                        if (user_init_minutes > db_init_minutes) {
                          int db_final_minutes = int.parse(UserFinalMin);
                          if (FinalDBHrs == USER_hour) {
                            if (user_init_minutes > db_final_minutes) {
                              // save data...
                              inputData();
                            } else {
                              //toast..
                              Fluttertoast.showToast(
                                  msg: 'Clash in Class',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } else {
                            //insert
                            inputData();
                          }
                        }
                      } else {}
                    } else {
                      //toast
                      Fluttertoast.showToast(
                          msg: 'Clash in Class',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  } else {
                    inputData();
                  }
                } else {
                  if (time == 0) {
                    Fluttertoast.showToast(
                        msg: 'Clash in Class',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    time = 1;
                  }
                }
              }
            });
          }
        });
      }
    });
  }
}

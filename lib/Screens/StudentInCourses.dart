import 'package:custom_check_box/custom_check_box.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/widget/fadedanimation.dart';

import '../global.dart';

class StudentInCourse extends StatefulWidget {
  @override
  _StudentInCourseState createState() => _StudentInCourseState();
}

class _StudentInCourseState extends State<StudentInCourse> {
  bool _isButtonDisabled;
  static bool _isAttendanceNotMarked = true;
  int _counter = 0;

  @override
  void initState() {
    _isButtonDisabled = false;
    Data.Retrieve_MyCourtses();
    //  TODO: implement initState
  }

  void _incrementCounter() {
    setState(() {
      _isButtonDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                child: ListDesign(),
              ),
              InkWell(
                onTap: () {
                  Data.MoveTowardsAttendance();
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
                      "Mark Attendance",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ListDesign() {
    bool ppresent = false;
    bool _isButtonDisabled;
    return ListView.builder(
      padding: EdgeInsets.all(5),
      itemCount: studentInClassModelList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Student Name :",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                studentInClassModelList[index].studentname ??
                                    'null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "Student Absents : 0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                studentInClassModelList[index].absent ?? 'null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "Student Presents :  0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                studentInClassModelList[index].present ??
                                    'null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                height: 30,
                                child: FloatingActionButton.extended(
                                  backgroundColor: Colors.green,
                                  onPressed: () {
                                    setState(() {
                                      present(index);
                                    });
                                  },
                                  label: Text("Present"),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 30,
                                child: FloatingActionButton.extended(
                                  backgroundColor: Colors.red,
                                  onPressed: () {
                                    setState(() {
                                      absent(index);
                                    });
                                  },
                                  label: Text("Absent"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void absent(int index) {
    String absent = studentInClassModelList.elementAt(index).absent;
    int abs = int.parse(absent);
    int _abs = abs + 1;
    studentInClassModelList[index].absent = _abs.toString();
  }

  static void present(int index) {
    String present = studentInClassModelList.elementAt(index).present;
    int pre = int.parse(present);

    int _pre = pre + 1;

    studentInClassModelList[index].present = _pre.toString();
  }
}

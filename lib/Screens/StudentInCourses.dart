import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theguiderteacherrr/Screens/HomeScreen.dart';
import 'package:theguiderteacherrr/widget/Appbar.dart';

import '../global.dart';

class StudentInCourse extends StatefulWidget {
  @override
  _StudentInCourseState createState() => _StudentInCourseState();
}

class _StudentInCourseState extends State<StudentInCourse> {
  bool _isButtonDisabled;
  static bool _isAttendanceNotMarked = true;
  int _counter = 0;
  bool _isCheck = false;

  CheckUpdate() {
    _isCheck = false;
    setState(() {});
  }

  @override
  void initState() {
    _isButtonDisabled = false;
    _isCheck = true;
    Data.Retrieve_MyCourtses();
    //  TODO: implement initState
    setState(() {});
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
                                  width: 5,
                                ),
                                // Text(
                                //   "Teacher Portal",
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 22,
                                //       fontWeight: FontWeight.bold),
                                // ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              //   GradientAppBar("Mark Attendance",),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Attendance',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                child: Expanded(child: ListDesign()),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    Data.MoveTowardsAttendance();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
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
      //padding: EdgeInsets.all(4),
      itemCount: studentInClassModelList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Column(
              children: [
                InkWell(
                  // onLongPress: () async {
                  //   String sid = studentInClassModelList[index].studentid;
                  //   String cid = studentInClassModelList[index].cid;
                  //   String absents = studentInClassModelList[index].absent;
                  //   String roomid = studentInClassModelList[index].roomid;
                  //   if(absents == 3) {
                  //     await RemoveStudent(sid, cid, absents, roomid);
                  //   }
                  // },
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
                          studentInClassModelList[index].check == true
                              ? Row(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          String sid =
                                              studentInClassModelList[index]
                                                  .studentid;
                                          String cid =
                                              studentInClassModelList[index].cid;
                                          String absents =
                                              studentInClassModelList[index].absent;
                                          String roomid =
                                              studentInClassModelList[index].roomid;
                                          if (absents == '3') {
                                            await  RemoveStudent(
                                                sid, cid, absents, roomid);
                                          }else{
                                            Fluttertoast.showToast(
                                                msg: 'Absent Not Reached Limits(3)',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      child: RaisedButton(
                                        child: Text("Present"),
                                        //    backgroundColor: Colors.green,
                                        onPressed: () {
                                          // CheckUpdate();
                                          studentInClassModelList[index].check =
                                              false;
                                          setState(() {
                                            present(index);
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 30,
                                      child: RaisedButton(
                                        // backgroundColor: Colors.red,
                                        child: Text("Absent"),
                                        onPressed: () {
                                          // CheckUpdate();
                                          studentInClassModelList[index].check =
                                              false;
                                          setState(() {
                                            absent(index);
                                          });
                                        },
                                        //label: Text("Absent"),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
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

  RemoveStudent(String sid, String cid, String absents, String roomid) {
    DatabaseReference reffer = FirebaseDatabase.instance
        .reference()
        .child("StudentCourse")
        .child(sid)
        .child(cid);
    reffer.remove().then((value) async {
      DatabaseReference reference = await FirebaseDatabase.instance
          .reference()
          .child("RoomAttendance")
          .child(roomid)
          .child(cid);
      reference.remove().then((value) async {
        Fluttertoast.showToast(
            msg: 'Student remove',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        await Navigator.pop(context);
      });
    });
  }
}

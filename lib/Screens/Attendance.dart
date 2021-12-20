import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/Model/attendanceList.dart';
import 'package:theguiderteacherrr/global.dart';
import 'package:theguiderteacherrr/widget/fadedanimation.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  void initState() {
    studentInClassModelList.clear();

    // TODO: implement initState
    super.initState();
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
                height: MediaQuery.of(context).size.height/1.1,
                width: MediaQuery.of(context).size.width,
                child: ListDesign(),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget ListDesign() {
    return ListView.builder(
      padding: EdgeInsets.all(5),
      itemCount: myCoursesList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Column(

              children: [
                FadeAnimation(
                    2,
                    InkWell(
                      onTap: () {

                        retrieveStudent(myCoursesList[index].cid, ctx);
                      },
                      child: Container(
                        height: 70,
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
                                    "Cource Name :" ,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    myCoursesList[index].Courcename,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    )),

              ],
            ),
          ),
        );
      },
    );
  }
}

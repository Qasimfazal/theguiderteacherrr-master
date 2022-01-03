import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/Screens/HomeScreen.dart';
import 'package:theguiderteacherrr/global.dart';
import 'package:theguiderteacherrr/widget/Appbar.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool _loading = true;
  @override
  void initState() {
    super.initState();

   Data.Retrieve_MyCourtses();
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      //   color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: CircularProgressIndicator()))
          : SafeArea(

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
                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Courses Attendance',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w300),),
                    ),

                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.1,
                        width: MediaQuery.of(context).size.width,
                        child: ListDesign(),
                      ),
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
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                    studentInClassModelList.clear();
                    studentSidList.clear();
                   Data.retrieveStudent(myCoursesList[index].cid, ctx);

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
                                "Cource Name :",
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

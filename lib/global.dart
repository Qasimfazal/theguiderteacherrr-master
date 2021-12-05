import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:theguiderteacherrr/Model/My_Cource_Model.dart';

List<MyCoursesModel> myCoursesList = new List<MyCoursesModel>();
List<String> Student_CourceList = new List<String>();

void Retrieve_MyCourtses() {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference DB_Refrance = FirebaseDatabase.instance.reference().child(
      "courseSchedule").child(auth.currentUser.uid);
  DB_Refrance.once().then((DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value;
    Iterable childkey1 = values.keys;
    childkey1.forEach((element) {
      Student_CourceList.add(element);
    });

    // Future.delayed(Duration(seconds: 5),(){
    //   for(int res =0; res<student_register_cource_list.length; res++){
    //     String select_days = R_Day;
    //     String slot_time = R_Slot_Time;
    //     if(student_register_cource_list.elementAt(res).SlotTime == slot_time && student_register_cource_list.elementAt(res).Day==select_days){
    //       statelist.add(true);
    //     }
    //     else{
    //       statelist.add(false);
    //
    //     }
    //   }
    //
    // });
    // Future.delayed(Duration(seconds: 5),(){
    //   if(statelist.contains(true)){
    //     Fluttertoast.showToast(
    //         msg: 'Clash in Class',
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //     statelist = new List<bool>();
    //     student_course_uidlist = new List<String>();
    //
    //     student_register_cource_list= new List<Student_Regester_Cources_Model>();
    //   }
    //   else{
    //     inputData();
    //     statelist = new List<bool>();
    //     student_course_uidlist = new List<String>();
    //     student_register_cource_list= new List<Student_Regester_Cources_Model>();
    //   }
    // });

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


  // void Retrieve_MyCourtses(){
  // FirebaseAuth auth = FirebaseAuth.instance;
  // DatabaseReference reff = FirebaseDatabase.instance.reference().child("StudentCourse").child(auth.currentUser.uid);
  // reff.once().then((DataSnapshot snapshot){
  //   Map<dynamic, dynamic> value = snapshot.value;
  //   Iterable childkey1 = value.keys;
  //   childkey1.forEach((element) {
  //     Student_CourceList.add(element);
  //     DatabaseReference reff = FirebaseDatabase.instance.reference().child("StudentCourse").child();
  //
  //     for(int res = 0; res<Student_CourceList.length; res++){
  //       Map<dynamic, dynamic> value = snapshot.value;
  //       Iterable childkey1 = value.keys;
  //       childkey1.forEach((element) {
  //         Student_CourceList.add(element);
  //   String RoomID = snapshot.value['RoomID'];
  //   String Courcename = snapshot.value['Courcename'];
  //   String Teacher_Uid = snapshot.value['Teacher_Uid'];
  //   String SlotNo = snapshot.value['SlotNo'];
  //   String SlotTime = snapshot.value['SlotTime'];
  //   String Absents = snapshot.value['Absents'];
  //   String Cid = snapshot.key;
  //   String Day = snapshot.value['Day'];
  //   String StudentStrength = snapshot.value['StudentStrength'];
  //   MyCoursesModel mcm = new MyCoursesModel(RoomID, Courcename, Cid, Teacher_Uid, SlotNo, SlotTime, Absents, Day, StudentStrength);
  //    myCoursesList.add(mcm);
  //
  //         });}});
  //   }
  //   );}
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       // title: Text("My Cources List"),
  //     ),
  //     body: Column(
  //       children: [
  //         Container(
  //           height: MediaQuery
  //               .of(context)
  //               .size
  //               .height / 1.2,
  //           width: MediaQuery
  //               .of(context)
  //               .size
  //               .width,
  //           child: ListView.builder(
  //             padding: EdgeInsets.all(5),
  //             itemCount: myCoursesList.length,
  //             itemBuilder: (BuildContext ctx, index) {
  //               return Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: InkWell(
  //                   onTap: () {
  //                     // Navigator.of(context).push(MaterialPageRoute(
  //                     //     builder: (BuildContext context) =>
  //                     //         CourceList[index].navigation));
  //                   },
  //                   child: Container(
  //                     height: 100,
  //                     decoration: BoxDecoration(
  //                       // image: DecorationImage(
  //                       //   image: AssetImage(CourceList[index].image??'null'),
  //                       //   fit: BoxFit.fill,
  //                       // ),
  //                       //color: const Color(0xff7c94b6),
  //                       border: Border.all(
  //                         color: Colors.deepPurple,
  //                         width: 1,
  //                       ),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.deepPurpleAccent.withOpacity(0.1),
  //                           spreadRadius: 2,
  //                           blurRadius: 7,
  //                           offset: Offset(
  //                               1, 3), // changes position of shadow
  //                         ),
  //                       ],
  //                       borderRadius: BorderRadius.circular(4),
  //                     ),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Text(myCoursesList[index].RoomID ?? 'null'),
  //                         Text(myCoursesList[index].SlotTime ?? 'null'),
  //                         Text(myCoursesList[index].SlotNo ?? "null"),
  //                         Text(myCoursesList[index].Absents ?? "null"),
  //                         Text(myCoursesList[index].Courcename ?? "null"),
  //                         // Text(myCoursesList[index].),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
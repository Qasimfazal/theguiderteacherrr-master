// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:theguiderteacherrr/Screens/HomeScreen.dart';
// import 'package:theguiderteacherrr/global.dart';
//
// class Loader extends StatefulWidget {
//   //const Loader({Key? key}) : super(key: key);
//
//   @override
//   _LoaderState createState() => _LoaderState();
// }
//
// class _LoaderState extends State<Loader> {
//   @override
//   navigate() async {
//     await Future.delayed(const Duration(seconds: 1), () {
//       Navigator.of(context).push(
//           MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
//     });
//   }
//
//   initi() async {
//     Timer(
//       Duration(seconds: 3),
//       () {
//         navigate();
//       },
//     );
//   }
//
//   void initState() {
//     myCoursesList.clear();
//     Data.Retrieve_MyCourtses();
//     initi();
//
//     super.initState();

//   }
//
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: Container(
//           color: Colors.white,
//           height: 50,
//           width: 80,
//           child: LoadingIndicator(
//               indicatorType: Indicator.ballBeat,
//
//               /// Required, The loading type of the widget
//               colors: const [Colors.blueAccent],
//
//               /// Optional, The color collections
//               strokeWidth: 2,
//
//               /// Optional, The stroke of the line, only applicable to widget which contains line
//               backgroundColor: Colors.white,
//
//               /// Optional, Background of the widget
//               pathBackgroundColor: Colors.white
//
//               /// Optional, the stroke backgroundColor
//               ),
//         ),
//       ),
//     );
//   }
// }

//  import 'dart:io';
//  import 'package:theguiderclienttt/List/MAdarsaList/MyCourceList.dart';
// import 'package:theguiderclienttt/globals.dart';
// import 'package:theguiderclienttt/model/Mycoursesmodel.dart';
//
// import 'globals.dart' as globals;
//  import 'package:firebase_auth/firebase_auth.dart';
//  import 'package:firebase_database/firebase_database.dart';
//  import 'package:flutter/cupertino.dart';
//  import 'package:flutter/foundation.dart';
//  import 'package:flutter/material.dart';
//  import 'package:jitsi_meet/jitsi_meet.dart';
//  import 'package:theguiderclienttt/widget/FadedAnimation.dart';
//
//  class Meeting extends StatefulWidget {
//    String TRANASfer_Room_Id;
//    String TRANASfer_Slot_time;
//    String TRANASfer_Slot_No;
//    String TRANASfer_Absence;
//    String TRANASfer_Cource_Name;
//    String cid ;
//    String tid;
//    String name;
//
//
//    Meeting(
//       this.TRANASfer_Room_Id,
//       this.TRANASfer_Slot_time,
//       this.TRANASfer_Slot_No,
//       this.TRANASfer_Absence,
//       this.TRANASfer_Cource_Name,
//       this.cid,
//       this.tid,
//       this.name);
//
//   @override
//    _MeetingState createState() => _MeetingState();
//  }
//
//  class _MeetingState extends State<Meeting> {
//   final serverText = TextEditingController();
//
//    final iosAppBarRGBAColor =    TextEditingController(text: "#0080FF80"); //transparent blue
//    bool isAudioOnly = true;
//    bool isAudioMuted = true;
//    bool isVideoMuted = true;
//    String RandomNumber = 'x';
//
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     JitsiMeet.addListener(JitsiMeetingListener(
//         onConferenceWillJoin: _onConferenceWillJoin,
//         onConferenceJoined: _onConferenceJoined,
//         onConferenceTerminated: _onConferenceTerminated,
//         onError: _onError));
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     JitsiMeet.removeAllListeners();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           // padding: const EdgeInsets.symmetric(
//           //   horizontal: 16.0,
//           // ),
//           child: kIsWeb
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: width * 0.30,
//                       child: meetConfig(),
//                     ),
//                     Container(
//                         width: width * 0.60,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Card(
//                               color: Colors.white54,
//                               child: SizedBox(
//                                 width: width * 0.60 * 0.70,
//                                 height: width * 0.60 * 0.70,
//                                 child: JitsiMeetConferencing(
//                                   extraJS: [
//                                     // extraJs setup example
//                                     '<script>function echo(){console.log("echo!!!")};</script>',
//                                     '<script src="https://code.jquery.com/jquery-3.5.1.slim.js"'
//                                         ' integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" '
//                                         'crossorigin="anonymous"></script>'
//                                   ],
//                                 ),
//                               )),
//                         ))
//                   ],
//                 )
//               : meetConfig(),
//         ),
//       ),
//     );
//   }
//
//   Widget meetConfig() {
//     String TRANASfer_Room_Id2;
//     String TRANASfer_Slot_time2;
//     String TRANASfer_Slot_No2;
//     String TRANASfer_Absence2;
//     String TRANASfer_Cource_Name2;
//     String cid2 ;
//     String tid2;
//     String name2;
//
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Column(
//             children: <Widget>[
//               Container(
//                 height: 180,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/background.png'),
//                         fit: BoxFit.fill)),
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned(
//                       left: 30,
//                       width: 80,
//                       height: 200,
//                       child: FadeAnimation(
//                           1,
//                           Container(
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage('assets/light-1.png'))),
//                           )),
//                     ),
//                     Positioned(
//                       left: 140,
//                       width: 80,
//                       height: 130,
//                       child: FadeAnimation(
//                           1.3,
//                           Container(
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage('assets/light-2.png'))),
//                           )),
//                     ),
//                     Positioned(
//                       right: 40,
//                       top: 40,
//                       width: 80,
//                       height: 150,
//                       child: FadeAnimation(
//                           1.5,
//                           Container(
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage('assets/clock.png'))),
//                           )),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(30.0),
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 7.0),
//                       child: Container(
//                         //margin: EdgeInsets.only(top: 120),
//                         child: Center(
//                           child: Text(
//                             "Cource Detail",
//                             style: TextStyle(
//                                 color: Colors.black45,
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                     FadeAnimation(
//                         1.8,
//                         Container(
//                           padding: EdgeInsets.all(5),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Color.fromRGBO(143, 148, 251, .2),
//                                     blurRadius: 20.0,
//                                     offset: Offset(0, 10))
//                               ]),
//                           child: Column(
//                             children: <Widget>[
//                             FadeAnimation(
//                             1.8,
//                               Container(
//                                 padding: EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey[100]))),
//                                 child: Row(
//                                   children: [
//                                     Text('Cource Name :'),
//                                     Spacer(),
//                                     Text(TRANASfer_Cource_Name2 = widget.TRANASfer_Cource_Name),
//                                   ],
//                                 ),
//                               ),
//                               ),FadeAnimation(
//                                 1.8,
//                               Container(
//
//                                 padding: EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey[100]))),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       'Teacher Name'
//                                     ),
//                                     Spacer(),
//                                     Text(name2= widget.name??' Null',style: TextStyle(fontSize: MediaQuery.of(context).size.width/40),),
//                                   ],
//                                 ),
//                               ),
//                               ),
//                           FadeAnimation(
//                             1.8,
//                               Container(
//                                 padding: EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey[100]))),
//                                 child: Row(
//                                   children: [
//                                     Text('Student Strength'),
//                                     Spacer(),
//                                     Text(' Null'),
//                                   ],
//                                 ),
//                               ),
//                           ),
//                           FadeAnimation(
//                             1.8,
//                               Container(
//                                 padding: EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey[100]))),
//                                 child: Row(
//                                   children: [
//                                     Text('Room ID'),
//                                     Spacer(),
//                                     Text( TRANASfer_Room_Id2= widget.TRANASfer_Room_Id??' Null'),
//                                   ],
//                                 ),
//                               ),
//                           ),
//                           FadeAnimation(
//                             1.8,
//                               Container(
//                                 padding: EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey[100]))),
//                                 child: Row(
//                                   children: [
//                                     Text('CLass Start Timming'),
//                                     Spacer(),
//                                     Text( TRANASfer_Slot_time2= widget.TRANASfer_Slot_time??' Null'),
//
//                                   ],
//                                 ),
//                               ),
//                           ),
//                           FadeAnimation(
//                             1.8,
//                               Container(
//
//                                 padding: EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey[100]))),
//                                 child: Row(
//                                   children: [
//                                     Text('Cource Duration '),
//                                     Spacer(),
//                                     Text( TRANASfer_Slot_No2= widget.TRANASfer_Slot_No??' Null'),
//                                   ],
//                                 ),
//                               ),
//     ),
//     FadeAnimation(
//     1.8,
//                               Container(
//                                 height: 40,
//                                 child: CheckboxListTile(
//                                   contentPadding: EdgeInsets.only(top: 0.4,bottom: 5.4,left: 9.4),
//                                   title: Text("Audio Only",style: TextStyle(fontSize: 14),),
//                                   value: isAudioOnly,
//                                   onChanged: _onAudioOnlyChanged,
//                                 ),
//                               ),
//     ),
//                           FadeAnimation(
//                             1.8,
//                               Container(
//                                 height: 40,
//                                 child: CheckboxListTile(
//                                   contentPadding: EdgeInsets.only(top: 0.4,bottom: 5.4,left: 9.4),
//                                   title: Text("Audio Muted",style: TextStyle(fontSize: 14),),
//                                   value: isAudioMuted,
//                                   onChanged: _onAudioMutedChanged,
//                                 ),
//                               ),
//                           ),
//                           FadeAnimation(
//                             1.8,
//                               CheckboxListTile(
//                                 contentPadding: EdgeInsets.only(top: 0.4,bottom: 5.4,left: 9.4),
//                                 title: Text("Video Muted",style: TextStyle(fontSize: 14),),
//                                 value: isVideoMuted,
//                                 onChanged: _onVideoMutedChanged,
//                               ),
//                           ),
//                               // Divider(
//                               //   height: 48.0,
//                               //   thickness: 2.0,
//                               // ),
//                             ],
//                           ),
//                         )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     FadeAnimation(
//                         2,
//                         InkWell(
//                           onTap: () {
//                             _joinMeeting();
//                           },
//                           // },
//                           child: Container(
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 gradient: LinearGradient(colors: [
//                                   Color.fromRGBO(143, 148, 251, 1),
//                                   Color.fromRGBO(143, 148, 251, .6),
//                                 ])),
//                             child: Center(
//                               child: Text(
//                                 "Join Meeting",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         )),
//                   ],
//                 ),
//               )
//             ],
//           ),
// //
// //           // Container(
// //           //     padding: EdgeInsets.all(5),
// //           //     decoration: BoxDecoration(
// //           //         color: Colors.white,
// //           //         borderRadius: BorderRadius.circular(10),
// //           //         boxShadow: [
// //           //           BoxShadow(
// //           //               color: Color.fromRGBO(143, 148, 251, .2),
// //           //               blurRadius: 20.0,
// //           //               offset: Offset(0, 10))
// //           //         ]),
// //           //     child: (Column(
// //           //       children: <Widget>[
// //           //         SizedBox(
// //           //           height: 16.0,
// //           //         ),
// //           //         Container(
// //           //           padding: EdgeInsets.all(8.0),
// //           //           child: TextFormField(
// //           //             controller: serverText,
// //           //             decoration: InputDecoration(
// //           //                 border: InputBorder.none,
// //           //                 hintText: "Hint: Leave empty for meet.jitsi.si",
// //           //                 labelText: 'Server URL',
// //           //                 hintStyle: TextStyle(color: Colors.grey[400])),
// //           //           ),
// //           //         ),
// //           //         // TextField(
// //           //         //   controller: serverText,
// //           //         //   decoration: InputDecoration(
// //           //         //       border: OutlineInputBorder(),
// //           //         //       labelText: "Server URL",
// //           //         //       hintText: "Hint: Leave empty for meet.jitsi.si"),
// //           //         // ),
// //           //         // SizedBox(
// //           //         //   height: 14.0,
// //           //         // ),
// //           //         Container(
// //           //           padding: EdgeInsets.all(8.0),
// //           //           child: TextFormField(
// //           //             controller: roomText,
// //           //             decoration: InputDecoration(
// //           //                 border: InputBorder.none,
// //           //                 hintText: "Room",
// //           //                 //  labelText: 'Server URL',
// //           //                 hintStyle: TextStyle(color: Colors.grey[400])),
// //           //           ),
// //           //         ),
// //           //         // TextField(
// //           //         //   controller: roomText,
// //           //         //   decoration: InputDecoration(
// //           //         //     border: OutlineInputBorder(),
// //           //         //     labelText: "Room",
// //           //         //   ),
// //           //         // ),
// //           //         // SizedBox(
// //           //         //   height: 14.0,
// //           //         // ),
// //           //         Container(
// //           //           padding: EdgeInsets.all(8.0),
// //           //           child: TextFormField(
// //           //             controller: subjectText,
// //           //             decoration: InputDecoration(
// //           //                 border: InputBorder.none,
// //           //                 hintText: "Subject",
// //           //                 hintStyle: TextStyle(color: Colors.grey[400])),
// //           //           ),
// //           //         ),
// //           //         // TextField(
// //           //         //   controller: subjectText,
// //           //         //   decoration: InputDecoration(
// //           //         //     border: OutlineInputBorder(),
// //           //         //     labelText: "Subject",
// //           //         //   ),
// //           //         // ),
// //           //         // SizedBox(
// //           //         //   height: 14.0,
// //           //         // ),
// //           //         Container(
// //           //           padding: EdgeInsets.all(8.0),
// //           //           child: TextFormField(
// //           //             controller: nameText,
// //           //             decoration: InputDecoration(
// //           //                 border: InputBorder.none,
// //           //                 hintText: "Display Name",
// //           //                 hintStyle: TextStyle(color: Colors.grey[400])),
// //           //           ),
// //           //         ),
// //           //         // TextField(
// //           //         //   controller: nameText,
// //           //         //   decoration: InputDecoration(
// //           //         //     border: OutlineInputBorder(),
// //           //         //     labelText: "Display Name",
// //           //         //   ),
// //           //         // ),
// //           //         // SizedBox(
// //           //         //   height: 14.0,
// //           //         // ),
// //           //         Container(
// //           //           padding: EdgeInsets.all(8.0),
// //           //           child: TextFormField(
// //           //             controller: emailText,
// //           //             decoration: InputDecoration(
// //           //                 border: InputBorder.none,
// //           //                 hintText: "Email",
// //           //                 hintStyle: TextStyle(color: Colors.grey[400])),
// //           //           ),
// //           //         ),
// //           //         // TextField(
// //           //         //   controller: emailText,
// //           //         //   decoration: InputDecoration(
// //           //         //     border: OutlineInputBorder(),
// //           //         //     labelText: "Email",
// //           //         //   ),
// //           //         // ),
// //           //         // SizedBox(
// //           //         //   height: 14.0,
// //           //         // ),
// //           //         Container(
// //           //           padding: EdgeInsets.all(8.0),
// //           //           child: TextFormField(
// //           //             controller: iosAppBarRGBAColor,
// //           //             decoration: InputDecoration(
// //           //                 border: InputBorder.none,
// //           //                 hintText: "AppBar Color(IOS only)",
// //           //                 hintStyle: TextStyle(color: Colors.grey[400])),
// //           //           ),
// //           //         ),
// //           //         // TextField(
// //           //         //   controller: iosAppBarRGBAColor,
// //           //         //   decoration: InputDecoration(
// //           //         //       border: OutlineInputBorder(),
// //           //         //       labelText: "AppBar Color(IOS only)",
// //           //         //       hintText: "Hint: This HAS to be in HEX RGBA format"),
// //           //         // ),
// //           //         // SizedBox(
// //           //         //   height: 14.0,
// //           //         // ),
// //           //         CheckboxListTile(
// //           //           title: Text("Audio Only"),
// //           //           value: isAudioOnly,
// //           //           onChanged: _onAudioOnlyChanged,
// //           //         ),
// //           //         SizedBox(
// //           //           height: 4.0,
// //           //         ),
// //           //         CheckboxListTile(
// //           //           title: Text("Audio Muted"),
// //           //           value: isAudioMuted,
// //           //           onChanged: _onAudioMutedChanged,
// //           //         ),
// //           //         SizedBox(
// //           //           height: 4.0,
// //           //         ),
// //           //         CheckboxListTile(
// //           //           title: Text("Video Muted"),
// //           //           value: isVideoMuted,
// //           //           onChanged: _onVideoMutedChanged,
// //           //         ),
// //           //         Divider(
// //           //           height: 48.0,
// //           //           thickness: 2.0,
// //           //         ),
// //           //         FadeAnimation(
// //           //           1.8,
// //           //           SizedBox(
// //           //             height: 64.0,
// //           //             width: double.maxFinite,
// //           //             child: ElevatedButton(
// //           //               onPressed: () {
// //           //                 _joinMeeting();
// //           //               },
// //           //               child: Text(
// //           //                 "Join Meeting",
// //           //                 style: TextStyle(color: Colors.white),
// //           //               ),
// //           //               style: ButtonStyle(
// //           //                   backgroundColor: MaterialStateColor.resolveWith(
// //           //                       (states) => Colors.blue)),
// //           //             ),
// //           //           ),
// //           //         ),
// //           //         SizedBox(
// //           //           height: 48.0,
// //           //         ),
// //           //       ],
// //           //     )),
// //           //   ),
//         ],
//       ),
//     );
//   }
//
//   _onAudioOnlyChanged(bool value) {
//     setState(() {
//       isAudioOnly = value;
//     });
//   }
//
//   _onAudioMutedChanged(bool value) {
//     setState(() {
//       isAudioMuted = value;
//     });
//   }
//
//   _onVideoMutedChanged(bool value) {
//     setState(() {
//       isVideoMuted = value;
//     });
//   }
//
//   _joinMeeting() async {
//     String serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;
//
//     // Enable or disable any feature flag here
//     // If feature flag are not provided, default values will be used
//     // Full list of feature flags (and defaults) available in the README
//     Map<FeatureFlagEnum, bool> featureFlags = {
//       FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
//     };
//     if (!kIsWeb) {
//       // Here is an example, disabling features for each platform
//       if (Platform.isAndroid) {
//         // Disable ConnectionService usage on Android to avoid issues (see README)
//         featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
//       } else if (Platform.isIOS) {
//         // Disable PIP on iOS as it looks weird
//         featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
//       }
//     }
//     // Define meetings options here
//     var options = JitsiMeetingOptions()
//       ..serverURL = serverUrl
//       ..subject = "Sub.text"
//       ..userDisplayName = "nameText.text"
//      ..userEmail = "emailText.text"
//       ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
//       ..audioOnly = isAudioOnly
//       ..audioMuted = isAudioMuted
//       ..videoMuted = isVideoMuted
//       ..featureFlags.addAll(featureFlags)
//       ..webOptions = {
//         "roomName": 'rooom',
//         "width": "100%",
//         "height": "100%",
//         "enableWelcomePage": false,
//         "chromeExtensionBanner": null,
//      //   "userInfo": {"displayName": nameText.text}
//       };
//
//     debugPrint("JitsiMeetingOptions: $options");
//     await JitsiMeet.joinMeeting(
//       options,
//       listener: JitsiMeetingListener(
//           onConferenceWillJoin: (message) {
//             debugPrint("${options.room} will join with message: $message");
//           },
//           onConferenceJoined: (message) {
//             debugPrint("${options.room} joined with message: $message");
//           },
//           onConferenceTerminated: (message) {
//             debugPrint("${options.room} terminated with message: $message");
//           },
//           genericListeners: [
//             JitsiGenericListener(
//                 eventName: 'readyToClose',
//                 callback: (dynamic message) {
//                   debugPrint("readyToClose callback");
//                 }),
//           ]),
//     );
//   }
//
//   void _onConferenceWillJoin(message) {
//     debugPrint("_onConferenceWillJoin broadcasted with message: $message");
//   }
//
//   void _onConferenceJoined(message) {
//     debugPrint("_onConferenceJoined broadcasted with message: $message");
//   }
//
//   void _onConferenceTerminated(message) {
//     debugPrint("_onConferenceTerminated broadcasted with message: $message");
//   }
//
//   _onError(error) {
//     debugPrint("_onError broadcasted: $error");
//   }
//  }

import 'dart:io';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:theguiderteacherrr/global.dart';
import 'package:theguiderteacherrr/widget/fadedanimation.dart';

class Meeting extends StatefulWidget {
  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  final serverText = TextEditingController();
  final roomText = TextEditingController(text: "room");
  final subjectText = TextEditingController();
  final nameText = TextEditingController(text: "Plugin Test User");
  final emailText = TextEditingController(text: "fake@email.com");
  final iosAppBarRGBAColor =
  TextEditingController(text: "#0080FF80"); //transparent blue
  bool isAudioOnly = true;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  String RandomNumber = 'x';

  void Random_Generator() {
    RandomNumber = Random().nextInt(1000).toString();
    print(Text("NUmber is" + RandomNumber));
  }
  // void Random_Generator() {
  //   var rng = new Random();
  //   for (var i = 0; i < 10; i++) {
  //     print(rng.nextInt(100));
  //     rng = RandomNumber;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Random_Generator();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 16.0,
          // ),
          child: kIsWeb
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.30,
                child: meetConfig(),
              ),
              Container(
                  width: width * 0.60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Colors.white54,
                        child: SizedBox(
                          width: width * 0.60 * 0.70,
                          height: width * 0.60 * 0.70,
                          child: JitsiMeetConferencing(
                            extraJS: [
                              // extraJs setup example
                              '<script>function echo(){console.log("echo!!!")};</script>',
                              '<script src="https://code.jquery.com/jquery-3.5.1.slim.js"'
                                  ' integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" '
                                  'crossorigin="anonymous"></script>'
                            ],
                          ),
                        )),
                  ))
            ],
          )
              : meetConfig(),
        ),
      ),
    );
  }

  Widget meetConfig() {
    return SingleChildScrollView(
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
                  top: 30,
                  left: 30,
                  child: FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            "My Cources",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: EdgeInsets.all(5),
              itemCount: myCoursesList.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
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
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: Row(
                                    children: [
                                      Text('Room ID :'),
                                      Spacer(),
                                      Text(myCoursesList[index].RoomID??""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Divider(
                                    height: 9,
                                    thickness: 1.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: Row(
                                    children: [
                                      Text('Cource Name :'),
                                      Spacer(),
                                      Text(myCoursesList[index].Courcename??""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Divider(
                                    height: 9,
                                    thickness: 1.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: Row(
                                    children: [
                                      Text('Day :'),
                                      Spacer(),
                                      Text(myCoursesList[index].Day??""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Divider(
                                    height: 9,
                                    thickness: 1.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: Row(
                                    children: [
                                      Text('Timming :'),
                                      Spacer(),
                                      Text(myCoursesList[index].SlotTime??""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Divider(
                                    height: 9,
                                    thickness: 1.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10,bottom: 10),
                                  child: Row(
                                    children: [
                                      Text('Absence :'),
                                      Spacer(),
                                      Text(myCoursesList[index].Absents??""),
                                    ],
                                  ),
                                ),
                                CheckboxListTile(
                                  contentPadding:
                                  EdgeInsets.only(left: 15, right: 15),
                                  title: Text("Audio Only"),
                                  value: isAudioOnly,
                                  onChanged: _onAudioOnlyChanged,
                                ),

                                CheckboxListTile(
                                  contentPadding:
                                  EdgeInsets.only(left: 15, right: 16),
                                  title: Text("Audio Muted"),
                                  value: isAudioMuted,
                                  onChanged: _onAudioMutedChanged,
                                ),

                                CheckboxListTile(
                                  contentPadding:
                                  EdgeInsets.only(left: 15, right: 15),
                                  title: Text("Video Muted"),
                                  value: isVideoMuted,
                                  onChanged: _onVideoMutedChanged,
                                ),
                                // Divider(
                                //   height: 48.0,
                                //   thickness: 2.0,
                                // ),
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
                              _joinMeeting(myCoursesList[index].RoomID,
                                  myCoursesList[index].Courcename);
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
                                  "Join Meeting",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _onAudioOnlyChanged(bool value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting(String Room_ID, CourceName) async {
    String serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: Room_ID)
      ..serverURL = serverUrl
      ..subject = CourceName
      ..userDisplayName = nameText.text
      ..userEmail = emailText.text
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": Room_ID,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": CourceName}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}

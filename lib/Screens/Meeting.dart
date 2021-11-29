import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:theguiderteacherrr/widget/fadedanimation.dart';

class Meeting extends StatefulWidget {
  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  final serverText = TextEditingController();
  // final roomText = TextEditingController(text: "plugintestroom");
  final roomText = TextEditingController(text: "room");
  final subjectText = TextEditingController(text: "My Plugin Test Meeting");
  final nameText = TextEditingController(text: "Plugin Test User");
  final emailText = TextEditingController(text: "fake@email.com");
  final iosAppBarRGBAColor =
      TextEditingController(text: "#0080FF80"); //transparent blue
  bool isAudioOnly = true;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  String RandomNumber ='x';

  void Random_Generator(){
    RandomNumber = Random().nextInt(1000).toString();
    print(Text("NUmber is"+RandomNumber));
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
        children: [
          Column(
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
                      top: 20,
                      left: 30,
                      child: FadeAnimation(
                          1.6,
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                "Create\nCource",
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
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextFormField(
                                  controller: serverText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          "Hint: Leave empty for meet.jitsi.si",
                                      labelText: 'Server URL',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: roomText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Room",
                                      //  labelText: 'Server URL',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: subjectText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Subject",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: nameText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Display Name",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: emailText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              CheckboxListTile(
                                title: Text("Audio Only"),
                                value: isAudioOnly,
                                onChanged: _onAudioOnlyChanged,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              CheckboxListTile(
                                title: Text("Audio Muted"),
                                value: isAudioMuted,
                                onChanged: _onAudioMutedChanged,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              CheckboxListTile(
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
                            _joinMeeting();
                          },
                          // onTap: () {
                          //   if (_formKey.currentState.validate()) {
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //         content: Text('Processing Data'),
                          //       ),
                          //     );
                          //     signup();
                          //     Navigator.pop(context);
                          //   }
                          // },
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
              )
            ],
          ),

          // Container(
          //     padding: EdgeInsets.all(5),
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //         boxShadow: [
          //           BoxShadow(
          //               color: Color.fromRGBO(143, 148, 251, .2),
          //               blurRadius: 20.0,
          //               offset: Offset(0, 10))
          //         ]),
          //     child: (Column(
          //       children: <Widget>[
          //         SizedBox(
          //           height: 16.0,
          //         ),
          //         Container(
          //           padding: EdgeInsets.all(8.0),
          //           child: TextFormField(
          //             controller: serverText,
          //             decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText: "Hint: Leave empty for meet.jitsi.si",
          //                 labelText: 'Server URL',
          //                 hintStyle: TextStyle(color: Colors.grey[400])),
          //           ),
          //         ),
          //         // TextField(
          //         //   controller: serverText,
          //         //   decoration: InputDecoration(
          //         //       border: OutlineInputBorder(),
          //         //       labelText: "Server URL",
          //         //       hintText: "Hint: Leave empty for meet.jitsi.si"),
          //         // ),
          //         // SizedBox(
          //         //   height: 14.0,
          //         // ),
          //         Container(
          //           padding: EdgeInsets.all(8.0),
          //           child: TextFormField(
          //             controller: roomText,
          //             decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText: "Room",
          //                 //  labelText: 'Server URL',
          //                 hintStyle: TextStyle(color: Colors.grey[400])),
          //           ),
          //         ),
          //         // TextField(
          //         //   controller: roomText,
          //         //   decoration: InputDecoration(
          //         //     border: OutlineInputBorder(),
          //         //     labelText: "Room",
          //         //   ),
          //         // ),
          //         // SizedBox(
          //         //   height: 14.0,
          //         // ),
          //         Container(
          //           padding: EdgeInsets.all(8.0),
          //           child: TextFormField(
          //             controller: subjectText,
          //             decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText: "Subject",
          //                 hintStyle: TextStyle(color: Colors.grey[400])),
          //           ),
          //         ),
          //         // TextField(
          //         //   controller: subjectText,
          //         //   decoration: InputDecoration(
          //         //     border: OutlineInputBorder(),
          //         //     labelText: "Subject",
          //         //   ),
          //         // ),
          //         // SizedBox(
          //         //   height: 14.0,
          //         // ),
          //         Container(
          //           padding: EdgeInsets.all(8.0),
          //           child: TextFormField(
          //             controller: nameText,
          //             decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText: "Display Name",
          //                 hintStyle: TextStyle(color: Colors.grey[400])),
          //           ),
          //         ),
          //         // TextField(
          //         //   controller: nameText,
          //         //   decoration: InputDecoration(
          //         //     border: OutlineInputBorder(),
          //         //     labelText: "Display Name",
          //         //   ),
          //         // ),
          //         // SizedBox(
          //         //   height: 14.0,
          //         // ),
          //         Container(
          //           padding: EdgeInsets.all(8.0),
          //           child: TextFormField(
          //             controller: emailText,
          //             decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText: "Email",
          //                 hintStyle: TextStyle(color: Colors.grey[400])),
          //           ),
          //         ),
          //         // TextField(
          //         //   controller: emailText,
          //         //   decoration: InputDecoration(
          //         //     border: OutlineInputBorder(),
          //         //     labelText: "Email",
          //         //   ),
          //         // ),
          //         // SizedBox(
          //         //   height: 14.0,
          //         // ),
          //         Container(
          //           padding: EdgeInsets.all(8.0),
          //           child: TextFormField(
          //             controller: iosAppBarRGBAColor,
          //             decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText: "AppBar Color(IOS only)",
          //                 hintStyle: TextStyle(color: Colors.grey[400])),
          //           ),
          //         ),
          //         // TextField(
          //         //   controller: iosAppBarRGBAColor,
          //         //   decoration: InputDecoration(
          //         //       border: OutlineInputBorder(),
          //         //       labelText: "AppBar Color(IOS only)",
          //         //       hintText: "Hint: This HAS to be in HEX RGBA format"),
          //         // ),
          //         // SizedBox(
          //         //   height: 14.0,
          //         // ),
          //         CheckboxListTile(
          //           title: Text("Audio Only"),
          //           value: isAudioOnly,
          //           onChanged: _onAudioOnlyChanged,
          //         ),
          //         SizedBox(
          //           height: 4.0,
          //         ),
          //         CheckboxListTile(
          //           title: Text("Audio Muted"),
          //           value: isAudioMuted,
          //           onChanged: _onAudioMutedChanged,
          //         ),
          //         SizedBox(
          //           height: 4.0,
          //         ),
          //         CheckboxListTile(
          //           title: Text("Video Muted"),
          //           value: isVideoMuted,
          //           onChanged: _onVideoMutedChanged,
          //         ),
          //         Divider(
          //           height: 48.0,
          //           thickness: 2.0,
          //         ),
          //         FadeAnimation(
          //           1.8,
          //           SizedBox(
          //             height: 64.0,
          //             width: double.maxFinite,
          //             child: ElevatedButton(
          //               onPressed: () {
          //                 _joinMeeting();
          //               },
          //               child: Text(
          //                 "Join Meeting",
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //               style: ButtonStyle(
          //                   backgroundColor: MaterialStateColor.resolveWith(
          //                       (states) => Colors.blue)),
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 48.0,
          //         ),
          //       ],
          //     )),
          //   ),
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

  _joinMeeting() async {
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
    var options = JitsiMeetingOptions(room: roomText.text)
      ..serverURL = serverUrl
      ..subject = subjectText.text
      ..userDisplayName = nameText.text
      ..userEmail = emailText.text
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": roomText.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": nameText.text}
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

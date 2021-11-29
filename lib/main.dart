import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/Screens/CreateCource.dart';
import 'package:theguiderteacherrr/Screens/Meeting.dart';
import 'package:theguiderteacherrr/Screens/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       home: Splashscreen(),
      //home: Meeting(),
     // home: AddCource(),
    );
  }
}

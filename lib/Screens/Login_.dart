import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:theguiderteacherrr/Screens/CreateCource.dart';
import 'package:theguiderteacherrr/Screens/HomeScreen.dart';
import 'package:theguiderteacherrr/Screens/Signup_.dart';
import 'package:theguiderteacherrr/global.dart';
import 'package:theguiderteacherrr/widget/fadedanimation.dart';

class Login extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;
  TextEditingController _email, _password;
  bool _loading = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  login() async {
    try {
      email = _email.text;
      password = _password.text;
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        String val = value.user.uid;
        if (val.isNotEmpty) {
          print('chal raha h');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          print('nahi araha');
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('Something went wrongs')));
          //
        }
      });
    } catch (e) {
      print('kkkkkkkk');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrongs')));
      // final snackBar = SnackBar(content: Text(e.toString()));
      //
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }
  }

  @override
  void initState() {
    super.initState();
    _email = new TextEditingController();
    _password = new TextEditingController();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/istambol.png'),
                          fit: BoxFit.fill)),
                  // child: Stack(
                  //   children: <Widget>[
                  //     Positioned(
                  //       left: 30,
                  //       width: 80,
                  //       height: 200,
                  //       child: FadeAnimation(
                  //           1,
                  //           Container(
                  //             decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                     image: AssetImage('assets/light-1.png'))),
                  //           )),
                  //     ),
                  //     Positioned(
                  //       left: 140,
                  //       width: 80,
                  //       height: 150,
                  //       child: FadeAnimation(
                  //           1.3,
                  //           Container(
                  //             decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                     image: AssetImage('assets/light-2.png'))),
                  //           )),
                  //     ),
                  //     Positioned(
                  //       right: 40,
                  //       top: 40,
                  //       width: 80,
                  //       height: 150,
                  //       child: FadeAnimation(
                  //           1.5,
                  //           Container(
                  //             decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                     image: AssetImage('assets/clock.png'))),
                  //           )),
                  //     ),
                  //     Positioned(
                  //       child: FadeAnimation(
                  //           1.6,
                  //           Container(
                  //             margin: EdgeInsets.only(top: 50),
                  //             child: Center(
                  //               child: Text(
                  //                 "Login",
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 40,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //           )),
                  //     )
                  //   ],
                  // ),
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
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText:
                                              'Email or Phone number is required'),
                                      EmailValidator(
                                          errorText: 'Please enter valid email')
                                    ]),
                                    controller: _email,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'password is required'),
                                      MinLengthValidator(8,
                                          errorText:
                                              'password must be at least 8 digits long'),
                                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                          errorText:
                                              'passwords must have at least one special character')
                                    ]),
                                    controller: _password,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
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

                                login();
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
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                          1.5,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Text(
                              "Create Account ?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
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
}

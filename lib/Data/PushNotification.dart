import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:theguiderteacherrr/Model/StudentInClassModel.dart';

import '../global.dart';

class Notificationn {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static Future<void> SendNotification(String Usertoken,msg) async {
    final String serverToken =
        'AAAAYVS9YZQ:APA91bFVQ87bbIq_wirsVTsQovuU1LrKs_uC63zIE7phswVt83T6hhtHJiqaiz_i9DlZyIPieHEiPg8Lh7ywqz1Imw8Fx4HlFuPl6NOR-wK5a1LHNpI5VvG-xs4lKlVcWSpdzi3-5Wm9';

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': msg,
            'title': 'Attention',
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': Usertoken,

        },

      ),

    );
    Fluttertoast.showToast(
        msg: 'Notification Has been Send To Students',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

import 'package:daleel_yemen_cairo/Notification/message.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationClass {

  void configerFirebaseListners() {
    print (" HEY I AM HERE IN");
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

    // if (Platform.isIOs) {
    //   firebaseMessaging.requestNotificationPermissions(IosNotificationSettings());
    // }

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _setMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _setMessage(message);
      },
    );
  }

  List<Message> _message = [];

  _setMessage(Map<String, dynamic> message) {
    final notification = message['notification'];
    final data = message ['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data[ 'message'];
    // setState(() {
    //   Message m  = Message (title:title, body:body, message:mMessage);
    //   _message.add(m);
    // });
  }
}
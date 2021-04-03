import 'package:daleel_yemen_cairo/PushNotification/Data_push_Notification.dart';
import 'package:daleel_yemen_cairo/PushNotification/ItemPush.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushLocalNotification extends StatefulWidget {
  @override
  _PushLocalNotificationState createState() => _PushLocalNotificationState();
}

class _PushLocalNotificationState extends State<PushLocalNotification> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin;
  @override
  void initState() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var iosIntialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosIntialize);
    localNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    localNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: notificationSelected);
  }

  Future notificationSelected(String str) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text('Hello')));
  }

  // Future _showNotification() async {
  //   var androidDetails = new AndroidNotificationDetails(
  //       'channelId', 'Local Notification', 'channelDescription',
  //       importance: Importance.high);
  //   var iosDetails = new IOSNotificationDetails();
  //   var generalNotificationDetails =
  //       new NotificationDetails(android: androidDetails, iOS: iosDetails);
  //   await localNotificationsPlugin.show(0, 'Notify Title',
  //       'The body of the notification', generalNotificationDetails);
  // }

  List<PushNotification> myMessages = [];

  Future getMyMessages() async {
    myMessages = await PushNotification.readMessage();
    return myMessages;
    // setState(() {
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "الاشعارات",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: "Cairo"),
          ),
        ),
      ),
      body: FutureBuilder(
        future: getMyMessages(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: myMessages //
                  .map(
                    (catPush) => ItemPush(
                      catPush.id,
                      catPush.image,
                      catPush.date,
                      catPush.title,
                      catPush.description,
                      catPush.phone,
                    ),
                  )
                  .toList(),
            );
          } else {
            return new CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

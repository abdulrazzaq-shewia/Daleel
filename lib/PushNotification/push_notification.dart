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
    // TODO: implement initState
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

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        'channelId', 'Local Notification', 'channelDescription',
        importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotificationsPlugin.show(0, 'Notify Title',
        'The body of the notification', generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text('Search'),
        ),
        body: Text("YEs"),
        floatingActionButton: FloatingActionButton(
          onPressed: _showNotification,
          child: Icon(Icons.notification_important),
        ),
      
    );
  }
}

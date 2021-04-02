import 'package:daleel_yemen_cairo/Notification/Notification.dart';
import 'package:daleel_yemen_cairo/Sections/Section.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class CategoryItemHome extends StatelessWidget {
  final String home_id;
  final String home_image;
  final String home_title;
  final String newCollection;
  CategoryItemHome(
    this.home_id,
    this.home_image,
    this.home_title,
      this.newCollection,
  );

  void selectHome(BuildContext ctx) {
    // Navigator.push(ctx,MaterialPageRoute(builder: (context) => Section  (id:home_id,title:home_title,newCollection:newCollection)),);

    Navigator.of(ctx).pushNamed(Section.routName, arguments: {
      "home_id": home_id,
      "home_title": home_title,
      "newCollection":newCollection,
    });
  }
  getMyToken()async{
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String token = '';
    print("get my token ");
    await _firebaseMessaging.getToken().then((deviceToken) {
      print("The token is here: $deviceToken" );
    });

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
        child: Card(
          elevation: 7,
          color: Colors.green.withOpacity(0.7),
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(1),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.network(home_image),
                  radius: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  home_title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Cairo"),
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.9),
                    Colors.white24.withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        onTap: () {
          print (" YES   ---------------------");
          PushNotificationClass notificationClass = new PushNotificationClass();
          getMyToken();
          notificationClass.configerFirebaseListners();
          selectHome(context);
          // final route = MaterialPageRoute(builder: (context) => Section());
          // Navigator.push(context, route);
        });
  }
}

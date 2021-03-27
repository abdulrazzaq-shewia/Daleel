import 'package:daleel_yemen_cairo/HomePage.dart';
import 'package:daleel_yemen_cairo/Notification/Notification.dart';
import 'package:daleel_yemen_cairo/PView.dart';
import 'package:daleel_yemen_cairo/Splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool decision = prefs.getBool("x");
  Widget screen = (decision == false || decision == null) ? PView() : Splash();
  runApp(screen);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // void initState(){
  //   PushNotificationClass notificationClass ;//= new PushNotificationClass();
  //   super.initState();
  //   // get token
  //   notificationClass.configerFirebaseListners();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              // ignore: deprecated_member_use
              child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  splashColor: Colors.orange,
                  highlightColor: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "الدخـــــول",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {
                    // List<MyAds> myAds = [];
                    // myAds = await DatabaseFunctions.readAds();

                    final route =
                        MaterialPageRoute(builder: (context) => HomePage());
                    Navigator.push(context, route);
                  })),
        ),
      ),
    );
  }
}

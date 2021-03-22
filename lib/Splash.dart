import 'package:daleel_yemen_cairo/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SplashScreen(
        seconds: 3,
        title: Text(
          "دليل اليمنيين الشامل في القاهرة",
          style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w800,
              fontFamily: "Cairo"),
        ),
        loaderColor: Colors.deepPurpleAccent,
        navigateAfterSeconds: HomePage(),
        image: Image.network(""),
        loadingText: Text(
          "جار التحميل",
          style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w800,
              fontFamily: "Cairo"),
        ),
      )),
    );
  }
}

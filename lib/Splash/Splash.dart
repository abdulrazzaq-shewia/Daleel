import 'package:daleel_yemen_cairo/HomePage.dart';
import 'package:daleel_yemen_cairo/Splash/SplashDatabase.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashDatabse splash = SplashDatabse();

  Future getSplash() async {
    splash = await DatabaseFunctionsSplash.readSplash();
    return splash;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: FutureBuilder(
              future: getSplash(),
              builder: (context, snapshot) {
                if (snapshot.hasData && splash !=null) {
                  return SplashScreen(
                    seconds: 5,
                    title: Text(
                      splash.title,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Cairo"),
                    ),
                    loaderColor: Colors.deepPurpleAccent,
                    image: Image.network(splash.image, fit: BoxFit.contain),
                    photoSize: 150,
                    loadingText: Text(
                      "جارٍ التحميل",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Cairo"),
                    ),
                    navigateAfterSeconds: HomePage(),
                  );
                } else {
                  return Text("");
                }
              })),
    );
  }
}

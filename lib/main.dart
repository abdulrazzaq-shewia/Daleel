import 'package:daleel_yemen_cairo/HomePage.dart';
import 'package:daleel_yemen_cairo/PView.dart';
import 'package:daleel_yemen_cairo/Splash/Splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daleel_yemen_cairo/Carousel/carouselPage.dart';
import 'package:daleel_yemen_cairo/Details/DetailPage.dart';
import 'package:daleel_yemen_cairo/Details/Details.dart';
import 'package:daleel_yemen_cairo/PushNotification/Detaile_Push.dart';
import 'package:daleel_yemen_cairo/Sections/Section.dart';
import 'package:daleel_yemen_cairo/Tips/Tips.dart';
import 'package:daleel_yemen_cairo/Tips/TipsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool decision = prefs.getBool("x");
  Widget screen = (decision == false || decision == null) ? PView() : Splash();
  runApp(
    Directionality(
      textDirection: TextDirection.rtl,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

          home: screen,


        routes: {
          "/a": (ctx) => HomePage(),
          "/b": (ctx) => Splash(),
          DetailPage.routName: (context) => DetailPage(),
          Section.routName: (context) => Section(),
          Tips.routName: (context) => Tips(),
          TipsPage.routName: (context) => TipsPage(),
          CarouselPage.routName: (context) => CarouselPage(),
          Details.routName: (context) => Details(),
          DetailsPush.routName: (context) => DetailsPush(),
        },
      ),
    ),
  );
}

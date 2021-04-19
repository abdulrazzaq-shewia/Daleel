import 'package:daleel_yemen_cairo/Carousel/mycarousel.dart';
import 'package:daleel_yemen_cairo/Home/CategoryScreenHomePage.dart';
import 'package:daleel_yemen_cairo/PushNotification/push_notification.dart';
import 'package:daleel_yemen_cairo/Tips/CategoryScreenTips.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {

    super.initState();
    configeration();


  }

  void configeration() async {
    await OneSignal.shared.init("b1c8f3f3-b844-46e9-8243-53d428f5c84e",
        iOSSettings: {
          OSiOSSettings.autoPrompt: false,
          OSiOSSettings.inAppLaunchUrl: false
        });
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    OneSignal.shared.setNotificationReceivedHandler((notification) {
      setState(() {
        // notifyContent =  notification.jsonRepresentation().replaceAll('\\n', '\n');
      });
    });
  }

  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(Icons.notification_important),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PushLocalNotification()),
              );
            }),
          ],
          title: Center(
              child: Text(
            "دليل اليمنيين الشامل في مصر",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: "Cairo"),
          )),
          leading: InkWell(
              onTap: () {
                launchWhatsapp(
                    number: "+201559091400",
                    message: "ماهي الاضافة التي تود إضافتها للتطبيق ؟" +
                        "\n "  );              },
              child: Image.asset(
                "assets/images/whatsapp.png",

                scale:20,
              )),
        ),
        body: Container(
          height: double.infinity,
          child: ListView(

            children: [
              Container(
                height: height/4.3,
                width: width,
                child: MyCarousel(),
              ),
              Container(
                height: height/8.5,
                width: width,
                child: CategoryScreenTips(),
              ),
              Container(
                height: height/1.9,
                width: width,
                color: Colors.white,
                child: CategoryScreenHomePage(),
              )
            ],
          ),
        ),
      ),
    );

  }
}


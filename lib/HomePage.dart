import 'package:daleel_yemen_cairo/Carousel/carouselPage.dart';
import 'package:daleel_yemen_cairo/Carousel/mycarousel.dart';
import 'package:daleel_yemen_cairo/Details/DetailPage.dart';
import 'package:daleel_yemen_cairo/Details/Details.dart';
import 'package:daleel_yemen_cairo/Home/CategoryScreenHomePage.dart';
import 'package:daleel_yemen_cairo/PushNotification/push_notification.dart';
import 'package:daleel_yemen_cairo/Sections/Section.dart';
import 'package:daleel_yemen_cairo/Tips/CategoryScreenTips.dart';
import 'package:daleel_yemen_cairo/Tips/Tips.dart';
import 'package:daleel_yemen_cairo/Tips/TipsPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listsearch = [];
  Future getData() async {
    // var url = "";
    // var response = await http.get(url);
    // var responsebody = jsonDecode(response.body);
    // for (int i = 0; i < responsebody.length; i++) {
    //   listsearch.add(responsebody[i]["title"]);
    // }
    // print(listsearch);
  }

  @override
  void initState() {
//////////////////

    int _counter = 0;

    final _firebaseMessaging = FirebaseMessaging();
    super.initState();
    configeration();

    // var initializationSettingsAndroid =
    //     new AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettingsIOS = new IOSInitializationSettings();
    // var initializationSettings = new InitializationSettings(
    //     initializationSettingsAndroid  );

    // var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    // flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: onSelectNotification);
  }

  void configeration() async {
    String notifyContent = "";
    await OneSignal.shared.init(
      "b1c8f3f3-b844-46e9-8243-53d428f5c84e",
        iOSSettings: {
          OSiOSSettings.autoPrompt: false,
          OSiOSSettings.inAppLaunchUrl: false
        });
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    OneSignal.shared.setNotificationReceivedHandler((notification) {
      setState(() {
        notifyContent =  notification.jsonRepresentation().replaceAll('\\n', '\n');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: DataSearch(list: listsearch));
                  }),
              IconButton(
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
          ),
          //  drawer: Center(child: MyDrawer()),
          body: ListView(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                child: MyCarousel(),
              ),
              Container(
                height: 85,
                child: CategoryScreenTips(),
              ),
              Container(
                height: 400,
                color: Colors.blueGrey,
                child: CategoryScreenHomePage(),
              )
            ],
          ),
        ),
      ),
      routes: {
        DetailPage.routName: (context) => DetailPage(),
        Section.routName: (context) => Section(),
        Tips.routName: (context) => Tips(),
        TipsPage.routName: (context) => TipsPage(),
        CarouselPage.routName: (context) => CarouselPage(),
        Details.routName: (context) => Details(),
      },
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  DataSearch({this.list});
  @override
  List<Widget> buildActions(BuildContext context) {
    //Action for AppBAr
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Icone Leading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results Search
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist =
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.label_important_sharp),
            title: Text(searchlist[i]),
            onTap: () {
              query = searchlist[i];
              showResults(context);
            },
          );
        });
  }
}

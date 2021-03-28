import 'dart:convert';

import 'package:daleel_yemen_cairo/Carousel/carouselPage.dart';
import 'package:daleel_yemen_cairo/Carousel/mycarousel.dart';
import 'package:daleel_yemen_cairo/Home/CategoryScreenHomePage.dart';
import 'package:daleel_yemen_cairo/Notification/Notification.dart';
import 'package:daleel_yemen_cairo/Sections/Section.dart';
import 'package:daleel_yemen_cairo/Tips/CategoryScreenTips.dart';
import 'package:daleel_yemen_cairo/Tips/Tips.dart';
import 'package:daleel_yemen_cairo/Tips/TipsPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
 getMyToken()async{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token = '';
  print("get my token ");
   await _firebaseMessaging.getToken().then((deviceToken) {
    print("The token is here: $deviceToken" );
  });

}
  @override
  void initState() {
     getMyToken();
    //final PushNotificationClass notificationClass =  PushNotificationClass();
     // get token
    //notificationClass.configerFirebaseListners();


    _configerFirebaseListners();
    getData();
    super.initState();
  }
  _configerFirebaseListners() {
    print (" HEY I AM HERE IN");
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

    // if (Platform.isIOs) {
    //   firebaseMessaging.requestNotificationPermissions(IosNotificationSettings());
    // }

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        setState(() {
          print("inside setState ");
        });
       // _setMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      //  _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
       // _setMessage(message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            // actions: [
            //   IconButton(
            //       icon: Icon(Icons.search),
            //       onPressed: () {
            //         showSearch(
            //             context: context,
            //             delegate: DataSearch(list: listsearch));
            //       })
            // ],
            title: Center(
                child: Text(
              "دليلك الشامل في مصر",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            )),
            leading: IconButton(
              icon: CircleAvatar(
                child: Image.asset("assets/images/whatsapp.png"),
                radius: 12,
              ),
              onPressed: () {
                launchWhatsapp(
                    number: "0201557772228",
                    message:
                        "مرحباً بك ...ماهي الاضافة التي تود وجودها في التطبيق؟ " +
                            "\n ");
              },
            ),
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
                color: Colors.white,
                child: CategoryScreenHomePage(),
              )
            ],
          ),
        ),
      ),
      routes: {
        Section.routName: (context) => Section(),
        Tips.routName: (context) => Tips(),
        TipsPage.routName: (context) => TipsPage(),
        CarouselPage.routName: (context) => CarouselPage(),
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

void launchWhatsapp({@required number, @required message}) async {
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

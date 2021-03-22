import 'dart:convert';

import 'package:daleel_yemen_cairo/Carousel/carouselPage.dart';
import 'package:daleel_yemen_cairo/Carousel/mycarousel.dart';
import 'package:daleel_yemen_cairo/Home/CategoryScreenHomePage.dart';
import 'package:daleel_yemen_cairo/Sections/Section.dart';
import 'package:daleel_yemen_cairo/Tips/CategoryScreenTips.dart';
import 'package:daleel_yemen_cairo/Tips/Tips.dart';
import 'package:daleel_yemen_cairo/Tips/TipsPage.dart';
import 'package:daleel_yemen_cairo/drawer/myDrawer.dart';
import 'package:flutter/material.dart';

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
    getData();
    super.initState();
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
                  })
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
            onTap:(){
              query = searchlist[i];
              showResults(context);
            },
          );
        });
  }
}

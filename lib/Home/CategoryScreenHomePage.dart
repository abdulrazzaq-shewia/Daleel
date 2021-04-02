import 'package:daleel_yemen_cairo/Data/Category_Home.dart';
import 'package:daleel_yemen_cairo/Data/Database.dart';
import 'package:daleel_yemen_cairo/Home/CategoryItemHome.dart';
import 'package:flutter/material.dart';

class CategoryScreenHomePage extends StatefulWidget {
  @override
  _CategoryScreenHomePageState createState() => _CategoryScreenHomePageState();
}
List<CategoryHome> myFolder = [];
Future getMyFolder()async{
  myFolder = await FirebaseFunctionDetail.readFolder();
  return myFolder;
}
class _CategoryScreenHomePageState extends State<CategoryScreenHomePage> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getMyFolder(),
    builder: (context,snapshot){

      return ListView(
          scrollDirection: Axis.vertical,

          padding: EdgeInsets.all(2),

          children: myFolder
              .map((catHome) => CategoryItemHome(
                    catHome.home_id,
                    catHome.home_image,
                    catHome.home_title,
            catHome.newCollection,
                  ))
              .toList());},
    );
  }
}

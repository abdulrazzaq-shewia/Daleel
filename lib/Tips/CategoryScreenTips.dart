import 'package:daleel_yemen_cairo/Tips/CategoryItemTips.dart';
import 'package:daleel_yemen_cairo/Tips/Category_Tips.dart';
import 'package:daleel_yemen_cairo/Tips/FirebaseFunctionTipsFolder.dart';
import 'package:flutter/material.dart';

class CategoryScreenTips extends StatefulWidget {
  @override
  _CategoryScreenTipsState createState() => _CategoryScreenTipsState();
}

class _CategoryScreenTipsState extends State<CategoryScreenTips> {
  List<CategoryTips> myFolder = [];

  Future getMyFolder()async{
    myFolder = await FirebaseFunctionTipsFolder.readFolder();
    return myFolder;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMyFolder(),
      builder: (context,snapshot){
        return ListView(

          scrollDirection: Axis.horizontal,

          children: myFolder
              .map((catTips) => CategoryItemTips(
            catTips.id,
            catTips.image,
            catTips.title,
            catTips.newCollection,
          ))
              .toList(),
        );
      },

    );
  }
}

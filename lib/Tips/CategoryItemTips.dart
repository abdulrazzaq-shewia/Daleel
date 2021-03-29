import 'package:daleel_yemen_cairo/Tips/Category_data_tips.dart';
import 'package:daleel_yemen_cairo/Tips/FirebaseFunctionTipsFolder.dart';
import 'package:daleel_yemen_cairo/Tips/Tips.dart';
import 'package:flutter/material.dart';

class CategoryItemTips extends StatelessWidget {



  final String id;
  final String image;
  final String title;
  final String newCollection;

  CategoryItemTips(
    this.id,
    this.image,
    this.title,
      this.newCollection,
  );
  void selecTips(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Tips.routName, arguments: {
      "id": id,
      "title": title,
      "newCollection": newCollection,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.deepOrange,
      borderRadius: BorderRadius.circular(5),
      child: Card(
        elevation: 5,
        color: Colors.indigo.withOpacity(0.4),
        child: Container(
          height: 85,
          width: 85,
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Image.network(image),
                radius: 20,
              ),
              Text(
               title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo"),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              )),
        ),
      ),
      onTap: () {
      //  print(" HI NEWCOLLECTION " + newCollection);

        selecTips(context);
      }
    );
  }
}

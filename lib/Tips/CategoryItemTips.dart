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
    String temp = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/How_to_use_icon.svg/1200px-How_to_use_icon.svg.png';
    return InkWell(
      splashColor: Colors.deepOrange,
      borderRadius: BorderRadius.circular(5),
      child: Card(
        elevation: 5,
        color: Colors.indigo.withOpacity(0.6),
        child: Container(
          height: 85,
          width: 85,
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: ((image!=null) && (image != ""))? Image.network(image):Image.network(temp),
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

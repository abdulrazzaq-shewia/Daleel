import 'package:daleel_yemen_cairo/Details/Details.dart';
import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Sections_id;
  // ignore: non_constant_identifier_names
  final String Sections_image;
  // ignore: non_constant_identifier_names
  final String Sections_title;
  final String newCollection;
  final String preID;
  final String preCollection;
  const SectionItem(
    this.Sections_id,
    this.Sections_image,
    this.Sections_title,
    this.newCollection,
    this.preID,
    this.preCollection,
  );

  void selecSection(BuildContext ctx) {

    Navigator.of(ctx).pushNamed(Details.routName, arguments: {
      "id": Sections_id,
      "title": Sections_title,
      "newCollection": newCollection,
      "preID": preID,
      "preCollection": preCollection,
    });
  }

  void selectSection() {}
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
          splashColor: Colors.deepOrange,
          borderRadius: BorderRadius.circular(5),
          child: Card(
            color: Colors.green.withOpacity(0.7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 7,
            margin: EdgeInsets.all(5),
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.network(Sections_image),
                    radius: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      Sections_title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Cairo"),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
            Navigator.of(context).pushNamed(Details.routName, arguments: {
              "id": Sections_id,
              "title": Sections_title,
              "newCollection": newCollection,
              "preID": preID,
              "preCollection": preCollection,
            });
          } // => selecSection(context),
          ),
    );
  }
}

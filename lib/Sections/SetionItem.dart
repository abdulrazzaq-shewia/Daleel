import 'package:daleel_yemen_cairo/Details/Details.dart';
import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  final String Sections_id;
  final String Sections_image;
  final String Sections_title;
  final String newCollection;
  final String preID;
  final String preCollection;
  const SectionItem(this.Sections_id, this.Sections_image, this.Sections_title,
      this.newCollection, this.preID, this.preCollection);

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        splashColor: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
        child: Card(
          color: Colors.deepPurple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          margin: EdgeInsets.all(5),
          child: Container(
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
                  width: 40,
                ),
                Text(
                  Sections_title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Cairo"),
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.orange,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        onTap: () => selecSection(context),
      ),
    );
  }
}

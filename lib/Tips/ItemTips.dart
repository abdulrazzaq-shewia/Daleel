import 'package:daleel_yemen_cairo/Tips/TipsPage.dart';
import 'package:flutter/material.dart';

class ItemTips extends StatelessWidget {
  final String id;
  final String title_description;
  final List<String> description;

  const ItemTips(
    this.id,
    this.title_description,
    this.description,
  );

  void selecTipsPage(BuildContext ctx) {

    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (context) => TipsPage(
          id: id,
          description: description,
          title_description: title_description,
        )));

    // print("Title Des" + title_description);
    // Navigator.of(ctx).pushNamed(
    //   TipsPage.routName,
    //   id: id,
    //   title_description: title_description,
    //   description: description,
   // );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        splashColor: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CircleAvatar(
                //   backgroundColor: Colors.grey,
                //   child: Image.asset(Sections_image),
                //   radius: 45,
                // ),

                Text(
                  title_description,
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
        onTap: () => selecTipsPage(context),
      ),
    );
  }
}

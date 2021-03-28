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


  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        splashColor: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
        child: Card(
          elevation: 7,
          color: Colors.green.shade200,
          child: Container(
            margin: EdgeInsets.all(3),

            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Text(
                  title_description,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Cairo"),
                ),
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
        onTap: () => selecTipsPage(context),
      ),
    );
  }
}

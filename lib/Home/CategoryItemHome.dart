import 'package:daleel_yemen_cairo/Sections/Section.dart';
import 'package:flutter/material.dart';

class CategoryItemHome extends StatelessWidget {
  final String home_id;
  final String home_image;
  final String home_title;
  final String newCollection;
  CategoryItemHome(
    this.home_id,
    this.home_image,
    this.home_title,
      this.newCollection,
  );

  void selectHome(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Section.routName, arguments: {
      "home_id": home_id,
      "home_title": home_title,
      "newCollection":newCollection,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(3),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.network(home_image),
                  radius: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  home_title,
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
                    Colors.green.withOpacity(0.8),
                    Colors.green.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        onTap: () {
          selectHome(context);
          // final route = MaterialPageRoute(builder: (context) => Section());
          // Navigator.push(context, route);
        });
  }
}

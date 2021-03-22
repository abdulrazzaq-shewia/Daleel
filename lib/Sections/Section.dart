import 'package:daleel_yemen_cairo/Data/Category_Sections.dart';
import 'package:daleel_yemen_cairo/Data/Database.dart';
import 'package:daleel_yemen_cairo/Details/DetailPage.dart';
import 'package:daleel_yemen_cairo/Details/Details.dart';
import 'package:daleel_yemen_cairo/Sections/SetionItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  static const routName = "Section";

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    final routSection =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final sectionId = routSection["home_id"];
    final sectionTitle = routSection["home_title"];
    final newCollection = routSection["newCollection"];

    List<CategorySection> myData = [];

    Future getMyData() async {
      myData =
          await FirebaseFunctionDetail.readSection(sectionId, newCollection);
      return myData;
      // setState(() {
      // });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              sectionTitle,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            )),
          ),
          body: FutureBuilder(
            future: getMyData(),
            builder: (context, snapshot) {

              return ListView(
                scrollDirection: Axis.vertical,
                children: myData //  CAROUSEL_DATA_CATEGORY
                    .map(
                      (carImage) => SectionItem(
                        carImage.Sections_id,
                        carImage.Sections_image,
                        carImage.Sections_title,
                        carImage.newCollection,
                        carImage.preID,
                        carImage.preCollection,
                      ),
                    )
                    .toList(),
              );
            },
          )),
      routes: {
        Details.routName: (context) => Details(),
        DetailPage.routName: (context) => DetailPage(),
      },
    );
  }
}

import 'package:daleel_yemen_cairo/Tips/Category_data_tips.dart';
import 'package:daleel_yemen_cairo/Tips/FirebaseFunctionTipsFolder.dart';
import 'package:daleel_yemen_cairo/Tips/ItemTips.dart';
import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  static const routName = "Tips";

  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {

  @override
  Widget build(BuildContext context) {
    List<CategoryDataTips> myData = [];
    final routTips =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final tipsId = routTips["id"];
    final newCollection = routTips["newCollection"];
    // print(tipsId + "THIS IS MY ID");

    Future getMyData() async {
      myData = await FirebaseFunctionTipsData.readData(tipsId, newCollection);
      print(myData[0].description.toString() + " HEY I AM HERE");
      return myData;
      // setState(() {
      // });
    }

    final tipsTitle = routTips["title"];
    // var catTips = myData.where((detail) {
    //   return detail.categories.contains(tipsId);
    // }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            tipsTitle,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: "Cairo"),
          )),
        ),
        body: FutureBuilder(
          future: getMyData(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: myData
                    .map(
                      (carImage) => ItemTips(
                        carImage.id,
                        carImage.title_description,
                        carImage.description,
                      ),
                    )
                    .toList(),
              );
            } else {
              return new CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

import 'package:daleel_yemen_cairo/Data/Category_Data.dart';
import 'package:daleel_yemen_cairo/Data/Database.dart';
import 'package:daleel_yemen_cairo/Details/ItemDetail.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  static const routName = "Details";
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    List<CategoryData> myData = [];

    final routDetail =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final detailsId = routDetail["id"];
    final detailsTitle = routDetail["title"];

    final newCollection = routDetail["newCollection"];
    final preCollection = routDetail["preCollection"];
    final preID = routDetail["preID"];
    Future getMyData() async {
      myData = await FirebaseFunctionDetail.readData(preID: preID, preCollection:preCollection , dataID:  detailsId, newCollection: newCollection);
      return myData;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              detailsTitle,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            ),
          ),
        ),


        body: FutureBuilder(
          future: getMyData(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              //  print("FUTRUEBUILDER IS HERE");
              return ListView(
                scrollDirection: Axis.vertical,
                children: myData //  CAROUSEL_DATA_CATEGORY
                    .map(
                      (carImage) => ItemDetail(
                        id: carImage.id,
                        image: carImage.image,
                        job: carImage.job,
                        location: carImage.location,
                        name: carImage.name,
                        phone: carImage.phone,
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

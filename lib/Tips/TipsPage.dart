import 'package:daleel_yemen_cairo/Tips/dummy_data_tips.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class TipsPage extends StatelessWidget {
  static const routName = "TipsPage";
  String id;
  String title_description;
  List<String> description;

  TipsPage({
    this.id,
    this.title_description,
    this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              title_description,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            ),
          ),
        ),
        body: Card(
          color: Colors.white,          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 5,
          margin: EdgeInsets.all(5),
          child: ListView(
            children: [
              Column(
                children: [
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     Icon(
                  //       Icons.circle,
                  //       color: Colors.red,
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Text(
                  //       title_description,
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           color: Colors.red,
                  //           fontWeight: FontWeight.w800,
                  //           fontFamily: "Cairo"),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 500,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.all(2),

                      itemBuilder: (ctx, index) => Card(
                        child: Text(
                          description[index],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Cairo"),
                        ),
                      ),
                      itemCount:
                          description.length, //TipslPage.description.length,
                    ),

                  ),
                  Row(
                    children: [
                      SizedBox(width: 120,),
                      // Icon(Icons.share,color: Colors.deepOrange),
                      SizedBox(width: 15,),
                      // ignore: deprecated_member_use
                      RaisedButton(
                          child: Text("مشاركة",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Cairo"),),
                          color: Colors.blue,
                          elevation: 7,
                          onPressed: () {
                            RenderBox box = context.findRenderObject();
                            Share.share(
                              title_description,
                              subject:title_description,
                              sharePositionOrigin:
                              box.localToGlobal(Offset.zero) &
                              box.size,
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void launchWhatsapp({@required number, @required message}) async {
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

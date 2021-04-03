import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: must_be_immutable
class TipsPage extends StatelessWidget {
  static const routName = "TipsPage";
  String id;
  // ignore: non_constant_identifier_names
  String title_description;
  List<String> description;

  TipsPage({
    this.id,
    // ignore: non_constant_identifier_names
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
          child: Column(
            children: [

              SizedBox(
                height: 5,
              ),
              Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.all(4),

                  itemBuilder: (ctx, index) => Card(
                    elevation: 3,

                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            description[index],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Cairo"),
                          ),
                        ),
                      ],
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
        ),
      ),
    );
  }
}

void launchWhatsapp({@required number, @required message}) async {
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
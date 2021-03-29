import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselPage extends StatelessWidget {
  static const routName = "CarouselPage";


  Future phoneCall(String phoneNumber)async{
    await FlutterPhoneDirectCaller.directCall(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final myAds =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "تفاصيل",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            ),
          ),
        ),
        body: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 10,
          margin: EdgeInsets.all(4),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height:200,
                      width: double.infinity,
                      child: Image.network(myAds['image'],fit: BoxFit.cover,)),
                  Container(
                    height: 300,
                    child: ListView(
                      children: [
                        Center(
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.all(10),
                            child: Text(

                              myAds['title'],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Cairo"),
                            ),
                          ),
                        ),

                        // ignore: deprecated_member_use

                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),

                            // ignore: deprecated_member_use
                            RaisedButton(
                              elevation: 4,
                              color: Colors.green,

                              onPressed: () async => {
                                phoneCall(myAds["phoneNumber"]),
                              },
                              child: Text(
                                "إتصال",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Cairo"),
                              ),
                            ),

                            Row(
                              children: [
                                // Icon(Icons.share,color: Colors.deepPurple),
                                SizedBox(
                                  width: 15,
                                ),
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(
                                      "مشاركة",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "Cairo"),
                                    ),
                                    color: Colors.blue,
                                    elevation: 4,
                                    onPressed: () {
                                      RenderBox box =
                                      context.findRenderObject();
                                      Share.share(
                                        myAds['title'] + "\n ",
                                        subject:  myAds['title'],
                                        sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                        box.size,
                                      );
                                    }),
                              ],
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                // Icon(
                                //   Icons.error_outline,
                                //   color: Colors.deepPurple,
                                // ),

                                // ignore: deprecated_member_use
                                RaisedButton(
                                  child: Text(
                                    "شكوى",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Cairo"),
                                  ),
                                  color: Colors.deepOrange,
                                  elevation: 4,
                                  onPressed: () {
                                    launchWhatsapp(
                                        number: "+201559091400",
                                        message: "تقديم شكوى بخصوص :" +
                                            "\n " +
                                            myAds['title'] +
                                            "\n ");
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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

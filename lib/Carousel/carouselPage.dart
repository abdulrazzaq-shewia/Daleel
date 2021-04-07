import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselPage extends StatelessWidget {
  static const routName = "CarouselPage";


  Future phoneCall(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
          elevation: 5,
          margin: EdgeInsets.all(4),
          child: Container(
            child: ListView(
              children: [
                Container(
                    height: height/3.5,
                    width: width,
                    child: Image.network(
                      myAds['image'],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        myAds['title'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Cairo"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),

                Container(
                  height: height/13,
                  child: Row(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                            RenderBox box = context.findRenderObject();
                            Share.share(
                              myAds['title'] + "\n ",
                              subject: myAds['title'],
                              sharePositionOrigin:
                              box.localToGlobal(Offset.zero) &
                              box.size,
                            );
                          }),



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
                ),
              ],
            ),
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

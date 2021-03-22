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
              "تفاصيل ",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            ),
          ),
        ),
        body: Card(
          color: Colors.blueAccent.withOpacity(0.7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 10,
          margin: EdgeInsets.all(4),
          child: ListView(
            children: [
              Column(
                children: [
                  Image.network(myAds['image']),
                  Container(
                    height: 350,
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              myAds['title'],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Cairo"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // ignore: deprecated_member_use
                        Row(
                          children: [
                            SizedBox(width: 15,),
                            Icon(Icons.phone,color: Colors.deepPurple,),
                            SizedBox(width: 15,),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              elevation: 4,

                              onPressed: () async {
                                //Launch(myAds["phoneNumber"]);
                               await  phoneCall(myAds["phoneNumber"]);
                              },
                              child: Text(
                                "إتصال",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "Cairo"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 15,),
                            Icon(Icons.share,color: Colors.deepPurple),
                            SizedBox(width: 15,),
                            // ignore: deprecated_member_use
                            RaisedButton(
                                child: Text("مشاركة الإعلان",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Cairo"),),
                                color: Colors.blue,
                                elevation: 4,
                                onPressed: () {
                                  RenderBox box = context.findRenderObject();
                                  Share.share(
                                    myAds["title"]+"\n"+"https://www.youtube.com/watch?v=3IuVXqb3VNY&list=PL4pYlnxrTLmaa0WdCwHttEzISpCxmOiou&index=89&t=52s",
                                    subject: myAds["phoneNumber"],
                                    sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                            box.size,
                                  );
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.error_outline,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "للشكاوى",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Cairo"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // ignore: deprecated_member_use
                      IconButton(
                        icon: CircleAvatar(
                          child: Image.asset("assets/images/whatsapp.png"),
                          radius: 30,
                        ),
                        onPressed: () {
                          launchWhatsapp(
                              number: "0201557772228", message: "مرحبا دكتور");
                        },
                      ),
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

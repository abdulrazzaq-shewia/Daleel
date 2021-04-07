import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailsPush extends StatelessWidget {
  static const routName = "DetailsPush";

  String id;
  String image;
  String title;
  String description;
  String phone;

  DetailsPush({
    this.id,
    this.image,
    this.title,
    this.description,
    this.phone,
  });

  // Future phoneCall(String phoneNumber) async {
  //   await FlutterPhoneDirectCaller.directCall(phoneNumber);
  // }
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final Map<String, Object> data = ModalRoute.of(context).settings.arguments;
    id = data["id"];
    image = data["image"];
    title = data["title"];
    description = data["description"];
    phone = data["phone"];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: "Cairo"),
          )),
        ),
        body: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          margin: EdgeInsets.all(3),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: height / 4,
                child: Image.network(
                  image,
                  // fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      children: [

                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Cairo"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                    indent: 25,
                    endIndent: 130,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      children: [

                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              description,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Cairo"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                    indent: 25,
                    endIndent: 130,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Colors.green,
                        elevation: 5,
                        onPressed: () async => {
                          phoneCall(phone),
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
                            RenderBox box =
                                context.findRenderObject();
                            Share.share(
                              title +
                                  "\n " +
                                  description +
                                  "\n " +
                                  "لمعرفة باقي التفاصيل يرجى تنزيل التطبيق من الرابط" +
                                  "\n " +
                                  "رابط التطبيق",
                              subject: description,
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
                                  title +
                                  "\n ");
                        },
                      ),
                    ],
                  ),
                ],
              ),
              // ignore: deprecated_member_use
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

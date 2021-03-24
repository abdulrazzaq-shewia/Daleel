import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  static const routName = "DetailPage";

  String id;
  String job;
  String name;
  String location;
  String phone;
  String image;
  DetailPage({
    this.id,
    this.job,
    this.name,
    this.location,
    this.phone,
    this.image,
  });

  Future phoneCall(String phoneNumber) async {
    await FlutterPhoneDirectCaller.directCall(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            )),
          ),
          body: Card(
            color: Colors.deepOrange.withOpacity(0.7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            margin: EdgeInsets.all(3),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.network(image),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Cairo"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home_repair_service,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            job,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Cairo"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            padding: EdgeInsets.all(5),
                            color: Colors.green,
                            child: Text(
                              location,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Cairo"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
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
                                onPressed: () async => {
                                  phoneCall(phone),
                                },
                                child: Text(
                                  "إتصال",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800,
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
                                          name + "\n " + job + "\n " + phone,
                                          subject: job,
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

                                  Text(
                                    "للشكاوى",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Cairo"),
                                  ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  // ignore: deprecated_member_use
                                  IconButton(
                                    icon: CircleAvatar(
                                      child: Image.asset(
                                          "assets/images/whatsapp.png"),
                                      radius: 30,
                                    ),
                                    onPressed: () {
                                      launchWhatsapp(
                                          number: "0201557772228",
                                          message: "تقديم شكوى بخصوص :" +
                                              "\n " +
                                              name +
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
                // ignore: deprecated_member_use
              ],
            ),
          ),
        ));
  }
}

void launchWhatsapp({@required number, @required message}) async {
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

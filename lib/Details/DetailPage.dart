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
final  Map<String, Object>data = ModalRoute.of(context).settings.arguments;
    id = data["id"];
    job = data["job"];
    name = data["name"];
    location = data["location"];
    phone = data["phone"];
    image = data["image"];

   // print("rcvd fdata ${rcvdData['name']}");
   // print("rcvd fdata)))))))))))))))))) ${rcvdData}");
   print("HLL(");


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
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.network(image),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              name,
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
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home_repair_service,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              job,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
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
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            padding: EdgeInsets.all(5),
                            // color: Colors.green,
                            child: Text(
                              location,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.redAccent,
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
                    SizedBox(
                      height: 50,
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
                                          name + "\n " + job +
                                              "\n "+"لمعرفة باقي التفاصيل يرجى تنزيل التطبيق من الرابط"
                                              + "\n "+"رابط التطبيق",
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
                                          number: "00201559091400",
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

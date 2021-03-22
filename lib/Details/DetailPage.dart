import 'package:flutter/material.dart';
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
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 20,
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.home_repair_service,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 20,
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          location,
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

                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.phone,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        // ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: () async => {
                            phone,
                          },
                          child: Text(phone),
                        ),
                      ],
                    ),
                    SizedBox(height: 60,),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 15,),
                            Icon(Icons.share,color: Colors.deepPurple),
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
                                elevation: 4,
                                onPressed: () {
                                  RenderBox box = context.findRenderObject();
                                  Share.share(
                                    name + "\n " + job +"\n "+phone,
                                    subject:job,
                                    sharePositionOrigin:
                                    box.localToGlobal(Offset.zero) &
                                    box.size,
                                  );
                                }),
                          ],
                        ),
                        SizedBox(
                          width: 20,
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
                                    number: "0201557772228",
                                    message: "مرحبا دكتور");
                              },
                            ),
                          ],
                        ),
                      ],
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

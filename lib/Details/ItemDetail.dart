import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemDetail extends StatelessWidget {
  final String id;
  final String job;
  final String name;
  final String location;
  final String phone;
  final String image;

  const ItemDetail({
    this.id,
    this.job,
    this.name,
    this.location,
    this.phone,
    this.image,
  });

  void selectDetail(BuildContext context) {
    Navigator.restorablePushNamed(context, "DetailPage",arguments: {
      "id" : id,
      "job": job,
      "name": name,
      "location":location,
      "phone":phone,
      "image":image});


  }

  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
   double  height = MediaQuery.of(context).size.height;

   return InkWell(
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          margin: EdgeInsets.all(5),

          child: Container(
            height: height/7,
            width: width,
            child: ListView(

              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  child: Image.network(image,fit: BoxFit.contain,),
                  radius: 35,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: width/1.5,
                          child: Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Cairo"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                           width: width/1.5,
                          child: Expanded(
                            child: Text(
                              job,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Cairo"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: (){
          Navigator.restorablePushNamed(context, "DetailPage",arguments: {
            "id" : id,
            "job": job,
            "name": name,
            "location":location,
            "phone":phone,
            "image":image});

        }// => selectDetail(context),
    );
  }
}

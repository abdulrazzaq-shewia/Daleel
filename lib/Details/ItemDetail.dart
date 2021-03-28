import 'package:daleel_yemen_cairo/Details/DetailPage.dart';
import 'package:flutter/material.dart';

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

  void selectDetail(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(
          id: id,
          job: job,
          name: name,
          location: location,
          phone: phone,
          image: image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        margin: EdgeInsets.all(5),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              child: Image.network(image),
              radius: 35,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Cairo"),
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
                      width: 200,
                      child: Text(
                        job,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Cairo"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () => selectDetail(context),
    );
  }
}

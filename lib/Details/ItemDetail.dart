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
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (context) => DetailPage(
              id: id,
              job: job,
              name: name,
              location: location,
              phone: phone,
              image: image,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(

        color: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 7,
        margin: EdgeInsets.all(5),
        child: Row(

          children: [
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              child: Image.network(image),
              radius: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Icon(Icons.person, color: Colors.white),

                Icon(
                  Icons.work,
                  color: Colors.white ,
                ),

              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cairo"),
                ),

                Text(
                  job,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cairo"),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      onTap: () => selectDetail(context),
    );
  }
}

import 'package:flutter/material.dart';

class ItemPush extends StatelessWidget {
  final String id;
  final String image;
  final String date;
  final String title;
  final String description;
  final String phone;

  const ItemPush(
    this.id,
    this.image,
    this.date,
    this.title,
    this.description,
    this.phone,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double  height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
          splashColor: Colors.deepOrange,
          borderRadius: BorderRadius.circular(5),
          child: Card(
            color: Colors.green.withOpacity(0.4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 7,
            margin: EdgeInsets.all(5),
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Image.network(image),
                        radius: 35,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Cairo"),
                        ),
                      ),

                    ],
                  ),
                  Text(
                    DateTime.now().day.toString() + "/" +
                        DateTime.now().month.toString()+ "/" +
                        DateTime.now().year.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Cairo"),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  )),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "DetailsPush", arguments: {
              "id": id,
              "image": image,
              "title": title,
              "description": description,
              "phone":phone,
            });
          } // => selecSection(context),
          ),
    );
  }
}

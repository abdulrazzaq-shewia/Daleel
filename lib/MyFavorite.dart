import 'package:flutter/material.dart';

class Myfavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title:Center(
          child: Text("قائمة مفضلاتي",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: "Cairo"),),
        )),
      ),
    );
  }
}

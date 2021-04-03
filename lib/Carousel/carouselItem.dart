import 'package:daleel_yemen_cairo/Carousel/carouselPage.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {


  final String id;
  final String image;
  final String title;
  final String phoneNumber;

  CarouselItem(
    this.id,
    this.image,
    this.title,
    this.phoneNumber,
  );

  void selectCarousel(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CarouselPage.routName,
      arguments: {
        "id": id,
        "image":image,
        "title":title,
        "phoneNumber":phoneNumber,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //  margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
        onTap: () {
          selectCarousel(context);
        },
      ),
    );
  }
}

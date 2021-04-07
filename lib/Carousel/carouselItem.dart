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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
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

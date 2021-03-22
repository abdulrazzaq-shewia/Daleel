import 'package:carousel_slider/carousel_slider.dart';
import 'package:daleel_yemen_cairo/Carousel/ads.dart';
import 'package:daleel_yemen_cairo/Carousel/carouselItem.dart';
import 'file:///E:/Flutter+Dart/Program/daleel_yemen_cairo/lib/Carousel/database.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  List<MyAds> myAds = [];

  Future getMyAds()async{
    myAds = await DatabaseFunctions.readAds();
   return myAds;
  }
  @override
  Widget build(BuildContext context) {

    return ListView(children: [
      SizedBox(
        height: 5,
      ),
      FutureBuilder(
        future: getMyAds(),
        builder: (context, snapshot) {
          return CarouselSlider(
            items: myAds //  CAROUSEL_DATA_CATEGORY
                .map(
                  (carImage) =>
                  CarouselItem(
                    carImage.id,
                    carImage.image,
                    carImage.title,
                    carImage.phoneNumber,
                  ),
            )
                .toList(),
            options: CarouselOptions(
              height: 150,
              initialPage: 0,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
          );

        }
      ),
    ]);
  }
}

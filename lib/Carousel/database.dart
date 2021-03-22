import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daleel_yemen_cairo/Carousel/ads.dart';

class DatabaseFunctions {
  static Future readAds() async {
    try {
      // QuerySnapshot qn = await firestore.collection('Daleel')
      // .getdocument();

      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection('Daleel')
          .document('AdsID')
          .collection('Ads')
          .getDocuments();
      List myAds = qn.documents.map((doc) {
        //List<CarouselData> ads = [];

        return MyAds(
          id: doc.data['id'],
          image: doc.data['image'],
          title: doc.data['title'],
          phoneNumber: doc.data['phoneNumber'],
        );
      }).toList();
      return myAds;
    } catch (e) {
      print(e.toString() + ' I am readAds function ');
      return null;
    }
  }
}

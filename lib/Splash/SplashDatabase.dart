import 'package:cloud_firestore/cloud_firestore.dart';

class SplashDatabse {
  String id;
  String image;
  String title;

  SplashDatabse({
    this.id,
    this.image,
    this.title,
  });
}

class DatabaseFunctionsSplash {
  static Future<SplashDatabse> readSplash() async {
    SplashDatabse obj;
    await Firestore.instance
        .collection('Daleel')
        .document('SplashID')
        .get()
        .then((DocumentSnapshot doc) {
      obj = new SplashDatabse(
        id: doc['id'],
        image: doc['image'],
        title: doc['title'],
      );
    });

    return obj;
  }
}

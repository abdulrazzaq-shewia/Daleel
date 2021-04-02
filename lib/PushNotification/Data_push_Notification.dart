import 'package:cloud_firestore/cloud_firestore.dart';

class PushNotification {
  String id;
  String image;
  String date;
  String title;
  String description;
  String phone;

  PushNotification({
    this.id,
    this.image,
    this.date,
    this.title,
    this.description,
    this.phone,
  });

  static Future readMessage() async {
    try {
      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection('Daleel')
          .document('MessageID')
          .collection('Message')
          .orderBy("date")
          .getDocuments();
      List myFolder = qn.documents.map((doc) {
        return PushNotification(
          id: doc.data['id'],
          image: doc.data['image'],
          date: doc.data['date'],
          title: doc.data['title'],
          description: doc.data['description'],
          phone:doc.data['phone']
        );
      }).toList();
      return myFolder;
    } catch (e) {
      print(e.toString() + ' I am readAds function ');
      return null;
    }
  }
}

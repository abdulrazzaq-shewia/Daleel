import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daleel_yemen_cairo/Tips/Category_Tips.dart';
import 'package:daleel_yemen_cairo/Tips/Category_data_tips.dart';


class FirebaseFunctionTipsFolder{

  static Future readFolder() async {
    try {
// QuerySnapshot qn = await firestore.collection('Daleel')
// .getdocument();

      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection('Daleel')
          .document('ServicesID')
          .collection('Services')
          .getDocuments();
      List myFolder = qn.documents.map((doc) {

        return CategoryTips(
          id: doc.data['id'],
          image: doc.data['image'],
          title: doc.data['title'],
          newCollection: doc.data['newCollection'],

        );
      }).toList();
      return myFolder;
    } catch (e) {
      print(e.toString() + ' I am readAds function ');
      return null;
    }
  }
}


class FirebaseFunctionTipsData{

  static Future readData(String id, String newCollection) async {

     try {


      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection('Daleel')
          .document("ServicesID")
          .collection('Services')
           .document(id).collection(newCollection)
      .getDocuments();

      List myData = qn.documents.map((doc) {

        return CategoryDataTips(
          id: doc.data['id'],
          title_description: doc.data['title_description'],
          description: List.from(doc.data['description']),
        );
      }).toList();
      return myData;
    } catch (e) {
      print(e.toString() + ' I am FirebaseFunctionTipsData function ');
      return null;
    }
  }
}

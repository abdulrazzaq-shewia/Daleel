



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daleel_yemen_cairo/Data/Category_Data.dart';
import 'package:daleel_yemen_cairo/Data/Category_Home.dart';
import 'package:daleel_yemen_cairo/Data/Category_Sections.dart';

class FirebaseFunctionDetail{

  static Future readFolder() async {
    try {


      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection('Daleel')
          .document('DetailsID')
          .collection('Details').orderBy('orderby')
          .getDocuments();
      List myFolder = qn.documents.map((doc) {

        return CategoryHome(
          home_id: doc.data['id'],
          home_image: doc.data['image'],
          home_title: doc.data['title'],
          newCollection: doc.data['newCollection'],

        );
      }).toList();
      return myFolder;
    } catch (e) {
      print(e.toString() + ' I am readAds function ');
      return null;
    }
  }


  static Future readSection(String sectionID, String newCollection) async {

    try {


      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection('Daleel')
          .document('DetailsID')
          .collection('Details')
          .document(sectionID)
      .collection(newCollection).orderBy("orderby")
          .getDocuments();
      List myFolder = qn.documents.map((doc) {

        return CategorySection(
          Sections_id: doc.data['id'],
          Sections_image: doc.data['image'],
          Sections_title: doc.data['title'],
          newCollection: doc.data['newCollection'],
          preCollection: doc.data['preCollection'],
          preID: doc.data['preID']

        );
      }).toList();
      return myFolder;

    } catch (e) {
      print(e.toString() + ' I am readAds function ');
      return null;
    }
  }
  static Future readData({String preID, String preCollection , String dataID, String newCollection}) async {
print("Here > "+ dataID + "   " + newCollection);
    try {


      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection('Daleel')
          .document('DetailsID')
          .collection('Details')
      .document(preID).collection(preCollection)
          .document(dataID)
          .collection(newCollection)
          .getDocuments();
      List myFolder = qn.documents.map((doc) {

        return CategoryData(
          id: doc.data['id'],
          image: doc.data['image'],
          job :doc.data["job"],
          location :doc.data["location"],
          name :doc.data["name"],
          phone:doc.data["phone"],
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

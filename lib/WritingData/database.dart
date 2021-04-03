

import 'package:cloud_firestore/cloud_firestore.dart';

class WriteInFirstore{
  String id,name,location,phone,phone2,image,job;
  WriteInFirstore({this.id,this.name,this.location,this.phone,this.phone2,this.image,this.job});
  writeInFirstore(List<WriteInFirstore> dataList)async{


    final DocumentReference  rowData =
    Firestore.instance.collection('Daleel').document('DetailsID').collection('Details')
        .document('AnaweenID').collection('Anaween').document('JameatID').collection('Jameat').document();
    print ('dataList.length : ' + dataList.length.toString());
    for(int i = 0 ; i < dataList.length; i++){
      WriteInFirstore obj = dataList[i];
      await rowData.setData({
        'id': obj.id,
        'name':obj.name,
        'job':obj.job,
        'location':obj.location,
        'image':obj.image,
        'phone':obj.phone,
        'phone2':obj.phone2,
      });
    }
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
  }
}
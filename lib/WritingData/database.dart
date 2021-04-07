import 'package:cloud_firestore/cloud_firestore.dart';

class WriteInFirstore {
  String id, name, location, phone, phone2, image, job;
  WriteInFirstore(
      {this.id,
        this.name,
        this.location,
        this.phone,
        this.phone2,
        this.image,
        this.job});
  factory WriteInFirstore.fromJson(Map<String, dynamic> json) {
    return WriteInFirstore(
      id: json['id'].toString(),
      location: json['location'] as String,
      image: json['image'] as String,
      phone: json['phone'].toString(),
      phone2: json['phone2'].toString(),
      job: json['job'] as String,
      name: json['name'] as String,
    );
  }
  Future writeInFirstore(List<WriteInFirstore> dataList) async {
    final DocumentReference rowData = Firestore.instance
        .collection('Daleel')
        .document('DetailsID')
        .collection('Details')
        .document('AnaweenID')
        .collection('Anaween')
        .document('MataemID');
    for (int i = 0; i < dataList.length; i++) {
      WriteInFirstore obj = dataList[i];
      print(obj.name);
      await rowData.collection('Mataem').document().setData({
        'id': obj.id,
        'name': obj.name,
        'job': obj.job,
        'location': obj.location,
        'image': obj.image,
        'phone': obj.phone,
        'phone2': obj.phone2,
      });
    }
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
  }
}

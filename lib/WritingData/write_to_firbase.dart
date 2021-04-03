import 'dart:convert';
import 'package:daleel_yemen_cairo/WritingData/database.dart';
import 'package:flutter/material.dart';


class WriteData extends StatefulWidget {
  @override
  _WriteDataState createState() => _WriteDataState();
}

class _WriteDataState extends State<WriteData> {
  List data;

  @override
  Widget build(BuildContext context) {
    WriteInFirstore obj =   WriteInFirstore();
    List<WriteInFirstore>dataList = [];
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview using local json file'),
          actions: [
            IconButton(icon: Icon(Icons.add), onPressed: (){
              obj.writeInFirstore(dataList);

            }),
          ],

        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/res/my_data.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var newData = json.decode(snapshot.data.toString());

              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  print(newData[index]['id'].toString() + "  INDEX ");
                  obj.id = newData[index]['id'].toString();
                  obj.name = newData[index]['name'];
                  obj.image = newData[index]['image'];
                  obj.job = newData[index]['job'];
                  obj.phone = newData[index]['phone'].toString();
                  obj.phone2 = newData[index]['phone2'].toString();
                  obj.location = newData[index]['location'];
                  dataList.add(obj);

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32, bottom: 32, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                },
                                child: Text(
                                  newData[index]['name'],
                                  //'Note Title',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              Text(
                                newData[index]['name'],
                                //'Note Text',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                          //SizedBox(width: 20),
                          // Container(
                          //   height: 50,
                          //   width: 50,
                          //   child: Image.asset(''),
                          // )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },
          ),
        ));
  }
}
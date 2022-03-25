import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dataModel.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    ReadJson();
    super.initState();
  }

  List<Data> dataList = new List<Data>();

  Future<void> ReadJson() async {
    final String response = await rootBundle.loadString('data.json');
    final data = await jsonDecode(response);
    dataList = new List();
    data.forEach((e) {
      Data newData = new Data();
      newData = Data.fromMap(e);
      dataList.add(newData);
    });
    print(dataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.1),
          child: Column(
            children: [
              Stack(
                  children: [
                Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height / 4.5,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                    left: 10,
                    top: MediaQuery.of(context).size.height / 10,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Positioned(
                    left: 10,
                    top: MediaQuery.of(context).size.height / 7,
                    child: Text(
                      "Bookings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold),
                    )),
              ]
              ),
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),

                children:List.generate(dataList.length, (index) {
                  return Padding(
                    padding: EdgeInsets.all(14),
                    child: Tile(
                      created_at: dataList[index].created_at,
                      end_datetime: dataList[index].end_datetime,
                      id: dataList[index].id,
                      kwh: dataList[index].kwh,
                      last_updated: dataList[index].last_updated,
                      location_name: dataList[index].location_name,
                      start_datetime: dataList[index].start_datetime,
                      total_cost: dataList[index].total_cost,
                      txn_id: dataList[index].txn_id,


                    ),
                  );
                })
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  String
      last_updated,
      created_at,
      txn_id,

      start_datetime,
      end_datetime,

      location_name;
  int id;
  double total_cost,kwh;
  Tile(
      {this.end_datetime,
      this.id,
      this.kwh,
      this.txn_id,
      this.total_cost,
      this.start_datetime,
      this.location_name,
      this.last_updated,
      this.created_at});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            // color: Colors.red,

            child: Padding(
              padding: const EdgeInsets.all(2),
              child:
                  Container(
                    color: Colors.white,
                    child: Column(
                      children:[ ListTile(
                        title: Text(location_name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        subtitle: Text(last_updated),
                        leading: CircleAvatar(
                          child: Image.asset("assets/icon.png"),
                        ),
                      ),
                      Text("$txn_id",style: TextStyle(fontSize:18,fontWeight: FontWeight.w300,color: Colors.green),),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10),
                        child: Row(
                          children: [
                            Icon(Icons.home,color: Colors.green),
                            Text("  $kwh kwh"),
                            SizedBox(width: MediaQuery.of(context).size.width/3,),
                            Icon(Icons.add_to_photos_sharp,color: Colors.green,),
                            Text("  Rs.$total_cost"),
                          ],
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10),
                        child: Row(
                          children: [
                            Icon(Icons.account_circle,color: Colors.green,),
                            Text("  ID:$id"),
                          ],
                        ),
                      ),
                        Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10),
                        child: Row(
                          children: [
                            Text(" Start Date-Time: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize:15,color: Colors.green),),
                            Text("$start_datetime "),

                          ],
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10),
                        child: Row(
                          children: [
                            Text(" End Date-Time: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize:15,color: Colors.green),),
                            Text("$end_datetime "),

                          ],
                        ),
                      ),
                      ]
                    ),

              ),
            ),
          ),
        )
      ],
    );
  }
}

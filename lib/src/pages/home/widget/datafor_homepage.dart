// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class datatable extends StatefulWidget {
  const datatable({Key? key}) : super(key: key);

  @override
  State<datatable> createState() => _datatableState();
}

class _datatableState extends State<datatable> {
  List<Map<String, dynamic>> itemdemo = [
    {
      'id': "dsvsvsdv2sv1502ds1v5",
      'detail': 10.5,
      'price': 7.5,
      'icons': Icon(
        FontAwesomeIcons.tractor,
      ),
      'date': DateTime.now()
    },
    {
      'id': "dsvsvvdvdvsdv2vdsv",
      'detail': 8.5,
      'price': 10,
      'icons': Icon(
        FontAwesomeIcons.tractor,
      ),
      'date': DateTime.now()
    },
    {
      'id': "dsvsvsdv2svvdsvdsv",
      'detail': 9.5,
      'price': 10.5,
      'icons': Icon(
        FontAwesomeIcons.tractor,
      ),
      'date': DateTime.now()
    },
  ];
  @override
  Widget build(BuildContext context) {
    print(itemdemo.length);
    return SingleChildScrollView(
        child: Column(
      children: itemdemo.map((e) {
        return Container(
          margin: EdgeInsets.only(top: 5),
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ข้าวโพด'),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('เพชรเจริญการเกษตร'),
                                        Text('10/10/66'),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 10,
                                  color: Colors.black,
                                ),
                                DataTable(columns: [
                                  // ignore: prefer_const_constructors
                                  DataColumn(label: Text('ลำดับ')),
                                  DataColumn(label: Text('หน่วยวัด')),
                                  DataColumn(label: Text('ราคา')),
                                  DataColumn(label: Text('ราคา')),
                                ], rows: [
                                  DataRow(cells: [
                                    DataCell(Text('1')),
                                    DataCell(Text('10')),
                                    DataCell(Text('7.50')),
                                    DataCell(Text('?')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('1')),
                                    DataCell(Text('10')),
                                    DataCell(Text('7.50')),
                                    DataCell(Text('?')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('1')),
                                    DataCell(Text('10')),
                                    DataCell(Text('7.50')),
                                    DataCell(Text('?')),
                                  ]),
                                ]),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ));
  }
}

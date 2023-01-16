// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:chutjen/src/model/product_Edit_model.dart';
import 'package:chutjen/src/model/product_model.dart';
import 'package:chutjen/style/style.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

InputDecoration inputDecoration(
    {Text? lable, double? redius, double? errtexthight}) {
  return InputDecoration(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.amber,
        ),
      ),
      errorStyle: TextStyle(
          height: errtexthight ?? 0, fontSize: 16, color: Colors.amber),
      alignLabelWithHint: true,
      border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(redius ?? 10)),
      label: lable ?? Text(''));
}

// ...................

Widget Alertdialog(
    {required BuildContext context,
    required List<ProductModelcontroller> data,
    required Productsmodel productModel}) {
  return Stack(
    children: [
      Container(
        color: Colors.black45,
      ),
      AlertDialog(
        backgroundColor: Colors.white,
        title: Text("ยืนยันรายการอัปเดต"),
        content: Container(
          child: Container(
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 600,
              rightHandSideColumnWidth: 100,
              tableHeight: 500,
              isFixedHeader: false,
              headerWidgets: [
                Container(
                  color: Colors.red,
                  height: 50,
                  width: 50,
                  child: Text('test1'),
                ),
                Container(
                  color: Colors.red,
                  height: 50,
                  width: 50,
                  child: Text('test1'),
                ),
              ],
              leftSideItemBuilder: generateFirstColumnRow,
              rightSideItemBuilder: generateRightHandSideColumnRow,
              itemCount: 3,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "ยกเลิก",
              style: headerStyle(colors: Colors.redAccent, fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              "ยืนยัน",
              style: headerStyle(colors: Colors.lightBlue, fontSize: 18),
            ),
            onPressed: () {},
          ),
        ],
      ),
    ],
  );
}

Expanded tableHeader({String? lable}) {
  return Expanded(
    child: Container(
      alignment: Alignment.center,
      child: Text('$lable'),
    ),
  );
}

// ............

Widget generateFirstColumnRow(BuildContext context, int index) {
  return Container(
    child: Text(''),
    width: 100,
    height: 52,
    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    alignment: Alignment.centerLeft,
  );
}

// ...................
Widget generateRightHandSideColumnRow(BuildContext context, int index) {
  return Row(
    children: <Widget>[
      Container(
        child: Text('test'),
        width: 200,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text('test'),
        width: 100,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    ],
  );
}

EdgeInsets Formpadding({double? l, double? t, double? r, double? b}) {
  return EdgeInsets.fromLTRB(l ?? 6, t ?? 6, r ?? 6, b ?? 6);
}

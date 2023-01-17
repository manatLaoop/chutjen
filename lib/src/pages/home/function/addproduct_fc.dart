// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:chutjen/src/model/product_Edit_model.dart';
import 'package:chutjen/src/model/product_model.dart';
import 'package:chutjen/style/style.dart';
import 'package:flutter/material.dart';

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
class modeltest {
  modeltest({required String this.name, required String this.age});
  final String name;
  final String age;
}

Widget Alertdialog({required BuildContext context, required String lable}) {
  return Stack(children: [
    Container(
      color: Colors.black45,
    ),
    AlertDialog(
      backgroundColor: Colors.white,
      title: Text("ยืนยันรายการอัปเดต"),
      content: Container(
        child: SizedBox(
          height: 50,
          child: Center(
              child: Text(
            '$lable',
            style: headerStyle(colors: Colors.lightGreen),
          )),
        ),
      ),
      actions: <Widget>[
        btnConfirm(context, title: 'ยกเลิก', colros: Colors.redAccent),
        btnConfirm(context, title: 'ยืนยัน', colros: Colors.lightGreen),
      ],
    ),
  ]);
}

TextButton btnConfirm(BuildContext context,
    {required String title, required Color colros}) {
  return TextButton(
    child: Text(
      '$title',
      style: headerStyle(colors: colros, fontSize: 18),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
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

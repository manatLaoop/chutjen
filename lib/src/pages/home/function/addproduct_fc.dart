// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, avoid_print, non_constant_identifier_names, camel_case_types, avoid_unnecessary_containers

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chutjen/src/model/product_Edit_model.dart';
import 'package:chutjen/src/model/product_model.dart';
import 'package:chutjen/src/services/network_service.dart';
import 'package:chutjen/style/style.dart';
import 'package:flutter/material.dart';

import '../../../../bloc/bloc/product_update_state_bloc.dart';

final NetworkService networkService = NetworkService();

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

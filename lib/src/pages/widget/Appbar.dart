// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';

AppBar appBar(
    {String? titles,
    List<Widget>? action,
    Color? colors,
    Widget? leading,
    bool? centerTitle,
    Color? textcolor,
    double? fontsize,
    FontWeight? fontWeight}) {
  return AppBar(
    titleTextStyle: TextStyle(
        color: textcolor ?? Colors.white,
        fontSize: fontsize ?? 20,
        fontWeight: fontWeight ?? FontWeight.normal),
    backgroundColor: colors ?? null,
    title: Text('${titles ?? ''}'),
    leading: leading ?? null,
    actions: action ?? null,
    centerTitle: centerTitle ?? null,
  );
}

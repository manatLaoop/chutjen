// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

TextStyle textStyle({Color? Colors, double? textSize}) {
  return TextStyle(
    color: Colors,
    fontSize: textSize,
  );
}

EdgeInsets paddingFrom(
        {double L = 0, double R = 0, double T = 0, double B = 0}) =>
    EdgeInsets.only(
      bottom: B,
      left: L,
      right: R,
      top: T,
    );
TextStyle headerStyle(
    {double? fontSize, FontWeight? fontWeight, Color? colors}) {
  return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: colors ?? Colors.white);
}

EdgeInsets padding({double? l, double? t, double? r, double? b}) {
  return EdgeInsets.fromLTRB(l ?? 8, t ?? 10, r ?? 8, b ?? 10);
}

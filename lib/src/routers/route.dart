// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:chutjen/src/routers/exportpath.dart';

class Router {
  static const index = '/index';
  static const login = '/Login';
  static const register = '/Register';


  static Map<String, WidgetBuilder> getAll() => route;

  static final Map<String, WidgetBuilder> route = {
    login: (context) => Login(),
    index: (context) => Index_page(),
    register: (context) => Register(),

  };
}

// ignore_for_file: prefer_const_constructors, unused_field

import 'package:chutjen/src/pages/home/index_page.dart';
import 'package:chutjen/src/pages/login/login_page.dart';
import 'package:chutjen/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class Router {
  static const index = 'Home';
  static const login = 'Login';
  static const register = 'Register';

  // ignore: prefer_final_fields, non_constant_identifier_names
  Map<String, WidgetBuilder> _Routers = {
    login: (context) => Login(),
    index: (context) => Index_page(),
    register: (context) => Register(),
  };
}

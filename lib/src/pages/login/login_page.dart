// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, avoid_init_to_null, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, avoid_returning_null_for_void, unused_local_variable

import 'dart:developer';

import 'package:chutjen/bloc/Authentication/autentication_bloc.dart';
import 'package:chutjen/src/model/user_model.dart';
import 'package:chutjen/src/pages/register/register_page.dart';
import 'package:chutjen/src/services/network_service.dart';
import 'package:chutjen/style/style.dart';
import 'package:chutjen/util/emal_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chutjen/src/routers/route.dart' as Custom_router;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final List<Color> colorsBg = [Color(0xFF45B649), Color(0xFFDCE35B)];
    final List<Color> colorsSingon = [Color(0xFFDCE35B), Colors.white];

    NetworkService networkService = NetworkService();
    User user = User();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  // color: Colors.lightGreen[400],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                      colors: colorsBg.reversed.toList(),
                      // tileModes : TileMode.decal,
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                ),
                height: _contaiberdtail(0.6)),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: _contaiberdtail(0.1),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      // topRight: Radius.circular(0),
                      // bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(0, 3),
                          spreadRadius: 2),
                    ],
                    color: Colors.white),
                child: Center(
                  // ignore: prefer_const_literals_to_create_immutables

                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: null,
                            icon: Icon(
                              Icons.key_off,
                              size: 50,
                            ),
                            label: Text(
                              "Login",
                              style:
                                  textStyle(Colors: Colors.grey, textSize: 20),
                            ),
                          ),
                          // ..............
                          TextFormField(
                            onSaved: (value) {
                              email = value.toString() as TextEditingController;
                            },
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return 'กรุณาระบุอีเมล์';
                              } else if (!emailValidator(email)) {
                                return 'รูปแบบอีเมล์ไม่ถูกต้อง';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: Inputdecoration(
                                borderRadius: 10,
                                lable: 'Email(อีเมล์)',
                                colors: Colors.lightGreen,
                                icons: Icon(Icons.email)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // password
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              password =
                                  value.toString() as TextEditingController;
                              if (value!.isNotEmpty && value != null) {}
                              return null;
                            },
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'กรุณาใส่รหัสผ่าน';
                              }
                              return null;
                            },
                            decoration: Inputdecoration(
                                lable: 'Password(รหัสผ่าน)',
                                borderRadius: 10,
                                colors: Colors.lightGreen,
                                icons: Icon(Icons.key)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                SharedPreferences _pref =
                                    await SharedPreferences.getInstance();
                                _formKey.currentState!.save();
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                } else {
                                  FutureBuilder<Response>(
                                    future: networkService.Login(
                                        gmail: email.text,
                                        password: password.text),
                                    builder: ((context,
                                        AsyncSnapshot<Response> snapshot) {
                                      if (snapshot.data!.statusCode == 200) {
                                        if (snapshot.data != null) {
                                          List<User> userdata = userFromJson(
                                              snapshot.data.toString());

                                     
                                          AutenticationBloc()
                                              .add(Loginsucess());
                                        }
                                      }

                                      // if (snapshot.hasError) {
                                      //   Aletdialog(
                                      //       statusCode: snapshot
                                      //           .data.statusCode!
                                      //           .toInt());
                                      // }
                                      return Center();
                                    }),
                                  );
                                }
                              },
                              icon: Icon(Icons.login),
                              label: Text('เข้าสู่ระบบ'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.lightGreen),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'ลืมรหัสผ่าน',
                                  style: textStyle(
                                    Colors: Colors.grey[600],
                                    textSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  '|',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 24),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Register');
                                },
                                child: Text(
                                  'สมัครสมาชิก',
                                  style: textStyle(
                                    Colors: Colors.grey[600],
                                    textSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 3,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors:
                                            colorsSingon.reversed.toList())),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'RO',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 3,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                  colors: colorsSingon,
                                )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: 'facebook',
                                  onPressed: () {},
                                  backgroundColor: Colors.lightBlue,
                                  child: FaIcon(FontAwesomeIcons.facebook)),
                              SizedBox(
                                width: 15,
                              ),
                              FloatingActionButton(
                                heroTag: 'google',
                                onPressed: () {},
                                backgroundColor: Colors.red[400],
                                child: FaIcon(FontAwesomeIcons.google),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AlertDialog Aletdialog({required int statusCode}) {
    return AlertDialog(
      title: Text('ไม่พบข้อมูลผู้ใช้งาน'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.peopleLine, size: 50),
        ],
      ),
      actions: [],
    );
  }

  InputDecoration Inputdecoration(
      {String? lable = '',
      double borderRadius = 0,
      Icon? icons = null,
      Color? colors = null}) {
    return InputDecoration(
      label: Text('${lable}', style: textStyle(Colors: Colors.lightGreen)),
      suffixIcon: icons,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  double _contaiberdtail(double size) {
    return MediaQuery.of(context).size.height * size;
  }
}

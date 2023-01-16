// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_null_comparison, curly_braces_in_flow_control_structures, unnecessary_string_interpolations, unnecessary_cast, prefer_is_empty, await_only_futures

import 'dart:io';
// import 'dart:ui';

import 'package:chutjen/bloc/address/address_bloc.dart';
import 'package:chutjen/src/constants/url.dart';
import 'package:chutjen/src/model/address_model.dart';
import 'package:chutjen/src/model/user_model.dart';
import 'package:chutjen/src/services/network_service.dart';
import 'package:chutjen/style/style.dart';
import 'package:chutjen/util/image_piket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  bool Obscurepassword = false;
  final focusNodepassword = FocusNode();
  final focusNodenamelasname = FocusNode();
  User? usermodel;
  String imageN =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png';

  // ..........image File
  int gender = 0;
  File? _fileimage;
  NetworkService networkService = NetworkService();
  late List<Address> Data;
  API path = API();

  final GlobalKey<FormFieldState> _FormStateAmpher =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _FormStateTumbone =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _FormStateprovince =
      GlobalKey<FormFieldState>();

  @override
  void initState() {
    Obscurepassword = false;
    usermodel = User();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สมัครสมาชิก'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  ImagePikets(callback),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        usermodel!.email = value.toString();
                        return null;
                      } else {
                        return 'กรุณาระบุอีเมล์';
                      }
                    },
                    onSaved: (value) {
                      usermodel!.email = value.toString();
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(focusNodepassword);
                    },
                    decoration: Inpudecorator(
                        lable: 'อีเมล์',
                        icons: Icon(Icons.email),
                        colors: Colors.green),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    focusNode: focusNodepassword,
                    keyboardType: TextInputType.text,
                    obscureText: Obscurepassword,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(focusNodenamelasname);
                    },
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (!value!.isNotEmpty || value == null) {
                        return 'กรุณาระบุรหัสผ่าน';
                      } else if (value.length <= 5) {
                        return '';
                      } else {
                        usermodel!.password = value.toString();
                      }
                    },
                    maxLength: 10,
                    decoration: Inpudecoratorpassword(
                        lable: 'รหัสผ่าน (อย่างน้อย 6 ตัว)',
                        iconss: Icon(
                          Icons.visibility_off,
                          color: Colors.amber,
                        ),
                        colors: Colors.green),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        onSaved: (value) {
                          usermodel!.nameLastname = value.toString();
                        },
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          } else {
                            return 'กรุณาระบุชื่อโปรไฟล์';
                          }
                        },
                        keyboardType: TextInputType.text,
                        focusNode: focusNodenamelasname,
                        decoration: Inpudecorator(
                            lable: 'ชื่อโปรไฟล์',
                            icons: Icon(Icons.add_card),
                            colors: Colors.green),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        child: Text("เพศ"),
                        padding: const EdgeInsets.only(left: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: 0,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value as int;
                                usermodel!.genders = value as int;
                              });
                            },
                          ),
                          Text('ชาย'),
                          Radio(
                            value: 1,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value as int;
                                usermodel!.genders = value as int;
                              });
                            },
                          ),
                          Text('หญิง'),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Dropdowprovinces(
                              valueKey: 'province',
                              lable: 'จังหวัด',
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(flex: 1, child: Dropdowsamphers()),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Flexible(flex: 1, child: Dropdowstumbone()),
                          Flexible(flex: 1, child: Container()),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (!_formKey.currentState!.validate() ||
                          !_FormStateAmpher.currentState!.validate() ||
                          !_FormStateTumbone.currentState!.validate() ||
                          !_FormStateprovince.currentState!.validate()) {
                        return;
                      } else {
                        userregister();
                      }
                    },
                    icon: FaIcon(FontAwesomeIcons.penToSquare),
                    label: Text('บันทึก'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Dropdowprovinces({required String valueKey, required String lable}) {
    return FutureBuilder<List<Address>>(
        future: NetworkService().getaddress(path: valueKey),
        builder: (context, sanapshot) {
          if (sanapshot.hasData) {
            List<Address>? Data = sanapshot.data;
            return DropdownButtonFormField(
              key: _FormStateprovince,
              decoration: dropdowDecuration('จังหวัด'),
              value: usermodel!.provinces,
              onChanged: (value) {
                if (usermodel!.provinces == value.toString()) {
                  return;
                }
                usermodel!.tambons = null;
                usermodel!.amphures = null;
                usermodel!.provinces = value.toString();
                _FormStateTumbone.currentState!.reset();
                _FormStateAmpher.currentState!.reset();

                context.read<AddressBloc>().add(Resetadress());
                context.read<AddressBloc>().add(
                    Feeddamphures(params: usermodel!.provinces.toString()));
              },
              items: Data!.length > 0
                  ? Data.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(
                        child: Text(
                          '${e.nameTh.toString()}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        value: '${e.id}',
                      );
                    }).toList()
                  : ['...'].map((e) {
                      return DropdownMenuItem(
                        child: Text('${e}'),
                        value: Text('$e'),
                      );
                    }).toList(),
              validator: (value) {
                if (usermodel!.provinces == null || usermodel!.amphures == '') {
                  return 'กรุณาเลือกจังหวัด';
                }

                return null;
              },
            );
            ;
          } else {
            return TextFormField(
              decoration: Inpudecorator(lable: 'netWork Error'),
            );
          }
        });
  }

  Widget Dropdowsamphers() {
    return BlocBuilder<AddressBloc, AddressInitial>(
      builder: (context, state) {
        return DropdownButtonFormField(
          key: _FormStateAmpher,
          decoration: dropdowDecuration('อำเภอ'),
          items: state.aumphers!.map((e) {
            return DropdownMenuItem(
                child: Text(
                  '${e.nameTh}',
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(fontSize: 15),
                ),
                value: e.id.toString());
          }).toList(),
          onChanged: (value) {
            if (usermodel!.amphures == value.toString()) {
              return;
            }
            _FormStateTumbone.currentState!.reset();
            usermodel!.amphures = value.toString();
            context
                .read<AddressBloc>()
                .add(Feeddtumbons(paramsT: usermodel!.amphures.toString()));
          },
          validator: (value) {
            if (usermodel!.amphures == null || usermodel!.amphures == '') {
              return 'กรุณาเลือกอำเภอ';
            }

            return null;
          },
          // onSaved: (value) {
        );
      },
    );
  }

  Widget Dropdowstumbone() {
    return BlocBuilder<AddressBloc, AddressInitial>(
      builder: (context, state) {
        return DropdownButtonFormField(
          key: _FormStateTumbone,
          items: state.tumsbons!.length > 0
              ? state.tumsbons!.map((e) {
                  return DropdownMenuItem(
                    child: Text(
                      '${e.nameTh}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: '${e.id}',
                  );
                }).toList()
              : [].map((e) {
                  return DropdownMenuItem(
                    child: Text('data'),
                    value: Text('0'),
                  );
                }).toList(),
          onChanged: (value) {
            usermodel!.tambons = value.toString();
          },
          validator: (value) {
            if (usermodel!.tambons == null || usermodel!.tambons == '') {
              return 'กรุณาเลือกตำบล';
            }

            return null;
          },
          // onSaved: (value) {
          //   usermodel!.tambons = value.toString();
          // },
          decoration: dropdowDecuration('ตำบล'),
        );
      },
    );
  }

  InputDecoration dropdowDecuration(String lable) {
    return InputDecoration(
      counterStyle: TextStyle(
        height: double.minPositive,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      label: Text('$lable'),
    );
  }

// ...................
  void userregister() {
    // print(usermodel!.email);
    // print(usermodel!.password);
    // print(usermodel!.genders);
    // print(usermodel!.provinces);
    // print(usermodel!.amphures);
    // print(usermodel!.tambons);
    // print(usermodel!.nameLastname);
    networkService.Register(user: usermodel!, imageProfile: _fileimage);
  }

  InputDecoration Inpudecorator({String? lable, Icon? icons, Color? colors}) {
    return InputDecoration(
      suffixIcon: icons ?? null,
      suffixIconColor: colors,
      label: Text('${lable}'),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  callback(File imageFile) {
    setState(() {
      _fileimage = imageFile;
    });
  }

  InputDecoration Inpudecoratorpassword(
      {String? lable, Icon? iconss, Color? colors}) {
    return InputDecoration(
      hintText: 'ประกอบด้วย ตัวอักษร A-Z และ 0-9',
      suffixIcon: IconButton(
          icon: Obscurepassword
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              Obscurepassword = !Obscurepassword;
            });
          }),
      suffixIconColor: colors,
      label: Text('${lable}'),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

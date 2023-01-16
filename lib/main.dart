// ignore_for_file: prefer_function_declarations_over_variables

import 'package:chutjen/bloc/address/address_bloc.dart';
import 'package:chutjen/src/pages/home/index_page.dart';
import 'package:chutjen/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressBloc = BlocProvider<AddressBloc>(
        create: (BuildContext context) => AddressBloc());
    return MultiBlocProvider(
      providers: [addressBloc],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.green),
          home: Index_page()),
    );
  }
}

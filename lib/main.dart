// ignore_for_file: prefer_function_declarations_over_variables, unused_local_variable, unnecessary_type_check, prefer_const_constructors, unused_import

import 'dart:developer';

import 'package:chutjen/bloc/Authentication/autentication_bloc.dart';
import 'package:chutjen/bloc/address/address_bloc.dart';
import 'package:chutjen/bloc/bloc/product_update_state_bloc.dart';
import 'package:chutjen/bloc/testimplemrt.dart';
import 'package:chutjen/src/pages/home/home_page.dart';
import 'package:chutjen/src/pages/home/index_page.dart';
import 'package:chutjen/src/pages/login/login_page.dart';
import 'package:chutjen/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chutjen/src/routers/route.dart' as Custom_router;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressBloc = BlocProvider<AddressBloc>(
      create: (BuildContext context) => AddressBloc(),
    );
    return BlocProvider<AutenticationBloc>(
      create: (BuildContext context) => AutenticationBloc()..add(AppStarted()),
      child: MultiBlocProvider(
        providers: [addressBloc],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.green),
          //
          routes: Custom_router.Router.getAll(),
          home: Scaffold(
            body: BlocBuilder<AutenticationBloc, Autenticationstate>(
              builder: ((context, state) {
                if (state is AuthenticationUnauthenticated) {
                  print(state);
                  return Login();
                } else if (state is AuthenticationAuthenticated) {
                  return Index_page();
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

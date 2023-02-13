// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors, unused_element

import 'package:bloc/bloc.dart';
import 'package:chutjen/src/pages/home/function/addproduct_fc.dart';
import 'package:chutjen/src/pages/login/login_page.dart';
import 'package:chutjen/src/services/network_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'autentication_event.dart';
part 'autentication_state.dart';

class AutenticationBloc extends Bloc<AutenticationEvent, Autenticationstate> {
  NetworkService networkService = NetworkService();

  AutenticationBloc() : super(Autenticationstate()) {
    on<AppStarted>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      if (pref.getString('token') == null) {
        emit(AuthenticationUnauthenticated());
      } else {
        String? email = pref.getString('email').toString();
        String? id = pref.getString('id').toString();
        String? nameLastname = pref.getString('nameLastname').toString();
        String? token = pref.getString('token').toString();
        bool tokenStatus = await networkService.CheckToken(
            email: email, id: id, nameLastname: nameLastname, token: token);
        if (tokenStatus) {
          emit(AuthenticationAuthenticated());
        } else {
          pref.clear();
          emit(AuthenticationUnauthenticated());
        }
      }
    });

    on<Loginsucess>((event, emit) {
      emit(AuthenticationAuthenticated());
    });
    on<Logout>((event, emit) async {
      print(456798);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      emit(AuthenticationUnauthenticated());
    });
  }
}

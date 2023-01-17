// ignore_for_file: prefer_const_constructors, unnecessary_cast

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chutjen/src/model/address_model.dart';
import 'package:chutjen/src/model/user_model.dart';
import 'package:chutjen/src/services/network_service.dart';
// import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressInitial> {
  User usermodel = User();
  AddressBloc() : super(AddressInitial(aumphers: [], tumsbons: [])) {
    on<Getprovinces>(
      (event, emit) {},
    );

    on<Feeddamphures>((event, emit) async {
      final params = event.params;

      List<Address> dataResult;
      var respone = await NetworkService().Getumphers(params: params);
      dataResult = addressFromJson(jsonEncode(respone.data)) as List<Address>;
      emit(state.copyWith(aumphers: dataResult));
    });
    on<Resetadress>((event, emit) {
      emit(state.copyWith(tumsbons: []));
    });

// .....................
    on<Feeddtumbons>((event, emit) async {
      List<Address> dataResult;
      String path = event.paramsT;
      var respone = await NetworkService().Gettumbons(path: path);
      dataResult = addressFromJson(jsonEncode(respone.data)) as List<Address>;

      emit(state.copyWith(tumsbons: dataResult));
    });
  }
}

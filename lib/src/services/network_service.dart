// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names, unnecessary_cast

import 'dart:convert';
import 'dart:developer';
// import 'dart:ffi';

import 'dart:io';

import 'package:chutjen/src/constants/url.dart';
import 'package:chutjen/src/model/address_model.dart';
import 'package:chutjen/src/model/product_Edit_model.dart';
import 'package:chutjen/src/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;
  static final _dio = Dio();
  // ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
  //   return handler.next(options);
  // }, onResponse: (response, handler) {
  //   return handler.next(response);
  // }, onError: (DioError e, handler) {
  //   return handler.next(e);
  // }));

  static final usermodel = User();
  void Register({required User user, File? imageProfile}) async {
    var data = FormData.fromMap({
      'email': user.email,
      'password': user.password,
      'nameLastname': user.nameLastname,
      'genders': user.genders,
      'provinces': user.provinces,
      'amphures': user.amphures,
      'tambons': user.tambons,
      'status': user.status,
      if (imageProfile != null)
        'Photo': await MultipartFile.fromFile(
          imageProfile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final Url = API.BaseUrl + API.register;

    Response response = await _dio.post(Url, data: data);
    if (response.statusCode == 201) {}
  }

// ..............
  Future<List<Address>> getaddress({required dynamic path}) async {
    final Url = API.BaseUrl + path.toString();

    Response response = await _dio.get(Url);
    if (response.statusCode == 200) {
      return addressFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<Response> Getumphers({required String params}) async {
    final Url = API.BaseUrl + API.Amphures + '/' + params;
    Response response = await _dio.get(Url);
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception('Network failed');
  }

  Future<Response> Gettumbons({required String path}) async {
    final Url = API.BaseUrl + API.Tambons + '/' + path.toString();

    Response responses = await _dio.get(Url);
    if (responses.statusCode == 200) {
      return responses;
    }
    throw Exception('Network failed');
  }

  Future<List<Productsmodel>> getProductmodelForEdit() async {
    final Url = API.BaseUrl + API.productmodel;
    Response responses = await _dio.get(Url);
    return productsmodelFromJson(jsonEncode(responses.data));
  }

  UpdateproductPrice({required Productsmodel data}) {
    final Url = API.BaseUrl + API.updatePrice;

    var datatest = {
      'addminid': data.addminid,
      'pname': data.pname,
      'productid': data.productid,
      'pseparatetype': data.pseparatetype,
      'priceDtail': data.priceDtail
    };

    print(jsonEncode(datatest));

    // Response updateproductPrice = _dio.post(Url, data: {}) as Response;
  }
}

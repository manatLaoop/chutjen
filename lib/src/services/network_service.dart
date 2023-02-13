// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names, unnecessary_cast, avoid_print, await_only_futures

import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'dart:io';

import 'package:chutjen/bloc/Authentication/autentication_bloc.dart';
import 'package:chutjen/src/constants/url.dart';
import 'package:chutjen/src/model/Token.dart';
import 'package:chutjen/src/model/address_model.dart';
import 'package:chutjen/src/model/product_Edit_model.dart';
import 'package:chutjen/src/model/user_model.dart';
import 'package:chutjen/src/pages/login/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  BuildContext? context;

  static final _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.baseUrl = API.BaseUrl;
          options.connectTimeout = 12000;

          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response!.statusCode != 200 | 201 | 202 | 203) {
          } else if (e.response!.statusCode == 501) {
            return handler.next(e.error);
          }
        },
      ),
    );

  Future<Map<String, dynamic>> Registers(
      {required User user, File? imageProfile}) async {
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

    final url = API.register;
    final Response response = await _dio.post(
      url,
      data: data,
    );

    if (response.statusCode == 201) {
      SharedPreferences Pref = await SharedPreferences.getInstance();
      List<User> userdata = await userFromJson(jsonEncode(response.data));

      Pref.setString(
          'token', 'bearer' + ' ' + response.headers.value('token').toString());
      Pref.setString('nameLastname', userdata[0].nameLastname.toString());
      Pref.setString('email', userdata[0].email.toString());
      Pref.setString('id', userdata[0].id.toString());
      return {
        'status': true,
        'Statuscode': response.statusCode,
        'message': response.statusMessage,
      };
    }
    return {
      'status': false,
      'Statuscode': response.statusCode,
      'message': response.statusMessage
    };
  }

  Future<Response> Login(
      {required String gmail, required String password}) async {
    final url = API.login;
    Response login = await _dio.post(url, data: {gmail, password});

    return login;
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

  Future<int?> UpdateproductPrice({required Productsmodel data}) async {
    final Url = API.BaseUrl + API.updatePrice;

    var updatedata = {
      'addminid': data.addminid,
      'productid': data.productid,
      'pseparatetype': data.pseparatetype,
      'pcolor': data.pcolor,
      'priceDtail': data.priceDtail,
    };

    Response updateproductPrice =
        await _dio.post(Url, data: updatedata) as Response;

    return updateproductPrice.statusCode;
  }

  Future<bool> CheckToken({
    required String id,
    required String email,
    required String nameLastname,
    required String token,
  }) async {
    final url = API.refreshToken;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    Response response = await _dio.get(url,
        options: Options(
            headers: {'id': id, 'gmail': email, '' 'authorization': token}));
    if (_pref.getString('token') == null) {
      return false;
    } else {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        await _pref.setString(
            'token', 'Bearer' + response.headers.value('token').toString());
        return true;
      } else {
        return false;
      }
    }
  }
}

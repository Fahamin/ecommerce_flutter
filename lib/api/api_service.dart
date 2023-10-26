import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/model/login/auth_model.dart';
import 'package:ecommerce_flutter/model/login/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var BaseUrl = "https://api.escuelajs.co/api/v1/";

  Future<AuthModel> signin(LoginModel loginModel) async {
    var response =
        await Dio().post("${BaseUrl}auth/login", data: loginModel.toJson());

    debugPrint("fahamin" + response.toString());

      return AuthModel.fromJson(response.data);

  }
}

dynamic returnResponse(response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = response.data;
      return responseJson;
    case 400:
      throw "400";
    case 401:
      throw "401";
    case 403:
      throw "403";
    case 500:
      throw "500";
    default:
      throw 'Error occured while communication with server'
          ' with status code : ${response.statusCode}';
  }
}

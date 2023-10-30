import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/model/login/auth_model.dart';
import 'package:ecommerce_flutter/model/login/login_response.dart';
import 'package:ecommerce_flutter/model/singup/singup_model.dart';
import 'package:ecommerce_flutter/model/singup/singup_response.dart';
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


  Future<SingupResponse> singUp(Singup singup) async {
    var response =
    await Dio().post("${BaseUrl}users", data: singup.toJson());

    debugPrint("fahamin" + response.toString());

    return SingupResponse.fromJson(response.data);

  }

}


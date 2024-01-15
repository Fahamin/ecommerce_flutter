import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/model/login/auth_model.dart';
import 'package:ecommerce_flutter/model/login/login_response.dart';
import 'package:ecommerce_flutter/model/singup/singup_model.dart';
import 'package:ecommerce_flutter/model/singup/singup_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/product/product_model.dart';

class ApiService {
  var BaseUrl = "https://api.escuelajs.co/api/v1/";

  Future<AuthModel> signin(LoginModel loginModel) async {
    var response = await http.post(Uri.parse("${BaseUrl}auth/login"),
        body: loginModel.toJson());

    debugPrint("fahamin" + response.toString());
    final body = jsonDecode(response.body);
    return AuthModel.fromJson(body);
  }

  Future<SingupResponse> singUp(Singup singup) async {
    var response =
        await http.post(Uri.parse("${BaseUrl}users"), body: singup.toJson());

    debugPrint("fahamin" + response.toString());
    final body = jsonDecode(response.body);

    return SingupResponse.fromJson(body);
  }

  Future<List<ProductModelByCategory>> getProductByCategory(
      var category) async {
    var response =
        await http.get(Uri.parse("${BaseUrl}products/?categoryId=$category"));
    List<ProductModelByCategory> _list = [];
    debugPrint("fahamin" + response.toString());

    final body = jsonDecode(response.body);
    debugPrint("fahamin" + body.toString());
    body.forEach((e) {
      _list.add(ProductModelByCategory.fromJson(e));
    });

    return _list;
  }
}

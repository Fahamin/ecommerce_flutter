import 'dart:convert';

import 'package:ecommerce_flutter/api/api_service.dart';
import 'package:ecommerce_flutter/model/login/login_response.dart';
import 'package:ecommerce_flutter/model/product/product_model.dart';
import 'package:ecommerce_flutter/model/singup/singup_model.dart';

import '../model/login/auth_model.dart';
import '../model/singup/singup_response.dart';

class ProductRepository {
  Future<AuthModel> signinData(LoginModel loginUserInput) async {
    final response = await ApiService().signin(loginUserInput);

    return response;
  }

  Future<SingupResponse> signUpData(Singup loginUserInput) async {
    final response = await ApiService().singUp(loginUserInput);

    return response;
  }

  Future<List<ProductModelByCategory>> getProductByCategory(var cat) async {
    final response = await ApiService().getProductByCategory(cat);

    return response;
  }
}

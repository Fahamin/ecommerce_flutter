import 'dart:convert';

import 'package:ecommerce_flutter/api/api_service.dart';
import 'package:ecommerce_flutter/model/login/login_model.dart';

import '../model/login/auth_model.dart';

class ProductRepository {
  Future<AuthModel> signinData(LoginModel loginUserInput) async {
    final response = await ApiService().signin(loginUserInput);

    return response;
  }
}

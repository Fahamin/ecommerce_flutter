import 'package:ecommerce_flutter/model/login/login_response.dart';
import 'package:ecommerce_flutter/model/singup/singup_model.dart';
import 'package:ecommerce_flutter/repository/product_repository.dart';
import 'package:ecommerce_flutter/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login/auth_model.dart';
import '../model/singup/singup_response.dart';
import '../utils/utils.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthModel>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(AuthModel());

  userSignin(LoginModel loginUserInput, context) async {
    // var loginUserInput =
    //     LoginUserInput(email: "sabitur@gmail.com", password: '123345678');
    AuthModel response = await ProductRepository().signinData(loginUserInput);
    if (response.accessToken != null) {
      final SharedPreferences db = await prefs;
      db.setString("uid", response.accessToken.toString());

      Get.toNamed(Routes.homePage);
      Fluttertoast.showToast(msg: "Login successfully");
    } else {
      Fluttertoast.showToast(msg: "User not found");
    }
  }
}


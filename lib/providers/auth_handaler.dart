import 'package:ecommerce_flutter/model/login_model.dart';
import 'package:ecommerce_flutter/repository/product_repository.dart';
import 'package:ecommerce_flutter/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_model.dart';
import '../utils/utils.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthModel>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(AuthModel());

  /* userSignup(SignupUserInput signupUserInput, context) async {
    AuthModel response =
    await ProductRepositories().signupData(signupUserInput);
    if (response.success == true) {
      state = response;
      final SharedPreferences db = await prefs;
      db.setString("token", response.data!.userid.toString());
      db.setString("name", response.data!.fullname.toString());
      db.setString("email", response.data!.email.toString());
      if (state.success == true) {
        Fluttertoast.showToast(msg: "sign-up successfully");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AndroidMainPage()),
                (route) => false);
      } else {
        Fluttertoast.showToast(msg: "User already exits");
      }
    }
  }
*/
  userSignin(LoginModel loginUserInput, context) async {
    // var loginUserInput =
    //     LoginUserInput(email: "sabitur@gmail.com", password: '123345678');
    AuthModel response = await ProductRepository().signinData(loginUserInput);
    if (response.accessToken != null) {
      state = response;
      final SharedPreferences db = await prefs;
      db.setString("uid", response.accessToken.toString());
      print("data is here i am seeing:${state.accessToken}");

      Fluttertoast.showToast(msg: "Login successfully");
    } else {
      Fluttertoast.showToast(msg: "User not found");
    }
  }
}

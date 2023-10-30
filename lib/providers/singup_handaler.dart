
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/singup/singup_model.dart';
import '../model/singup/singup_response.dart';
import '../repository/product_repository.dart';
import '../route/routes.dart';

final singUpProvider =
StateNotifierProvider<SignUpNotifier, SingupResponse>((ref) {
  return SignUpNotifier();
});

class SignUpNotifier extends StateNotifier<SingupResponse> {
  SignUpNotifier() : super(SingupResponse());

  userSignup(Singup signupUserInput, context) async {
    SingupResponse response =
    await ProductRepository().signUpData(signupUserInput);
    debugPrint("fahamin" + response.toString());

    if (response.name != null) {
      Get.toNamed(Routes.homePage);
    }
  }
}

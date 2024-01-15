import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:ecommerce_flutter/model/login/login_response.dart';
import 'package:ecommerce_flutter/providers/signin_handaler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../route/routes.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var emailcontroller = TextEditingController(text: "john@mail.com");

  var passwordcontroller = TextEditingController(text: "changeme");

  var state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 100,
                    width: 100,
                    image: AssetImage("assets/images/monarch_mart.png")),
                DInput(
                  controller: emailcontroller,
                  hint: 'Enter Your Email',
                ),
                DView.spaceHeight(),
                DInput(
                  controller: passwordcontroller,
                  hint: 'Enter Your Password',
                ),
                DView.spaceHeight(),
                ElevatedButton(
                    onPressed: () async {
                      if (emailcontroller.text.isNotEmpty &&
                          passwordcontroller.text.isNotEmpty) {
                        var loginModel = LoginModel(
                            email: emailcontroller.text,
                            password: passwordcontroller.text);
                        ref.read(authProvider.notifier)
                            .userSignin(loginModel, context);

                        emailcontroller.text = "";
                        passwordcontroller.text = "";
                      }
                    },
                    child: const Text("Login")),
                DView.spaceHeight(),
                ElevatedButton(
                    onPressed: () async {
                      createAccount();
                    },
                    child: Text("Create Account"))
              ],
            ),
          )
        ],
      ),
    ));
  }

  void createAccount() {
    Get.toNamed(Routes.createAccount);
  }
}

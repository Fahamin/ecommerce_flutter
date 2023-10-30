import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:ecommerce_flutter/model/singup/singup_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/login/login_response.dart';
import '../providers/signin_handaler.dart';
import '../providers/singup_handaler.dart';
import '../route/routes.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'login_screen.dart';

class CreateAccount extends ConsumerStatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccount> {
  var emailcontroller = TextEditingController(text: "nico@gmail.com");
  var passwordcontroller = TextEditingController(text: "1111");
  var nameControler = TextEditingController(text: "Nicolas");
  var avatarControler = TextEditingController(text: "https://api.lorem.space/image/face?w=640&h=480&r=867");

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
                    DView.spaceHeight(),

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
                    DInput(
                      controller: nameControler,
                      hint: 'Enter Your Name',
                    ),
                    DView.spaceHeight(),
                    DInput(
                      controller: avatarControler,
                      hint: 'Enter Your avater',
                    ),
                    DView.spaceHeight(),
                    ElevatedButton(
                        onPressed: () async {
                          if (emailcontroller.text.isNotEmpty &&
                              passwordcontroller.text.isNotEmpty&&
                              nameControler.text.isNotEmpty &&
                              avatarControler.text.isNotEmpty) {
                            var singUpModel = Singup(
                                name: nameControler.text,
                                avatar: avatarControler.text,
                                email: emailcontroller.text,
                                password: passwordcontroller.text);
                            ref
                                .read(singUpProvider.notifier)
                                .userSignup(singUpModel, context);

                            emailcontroller.text = "";
                            passwordcontroller.text = "";
                            nameControler.text = "";
                            avatarControler.text = "";
                          }
                        },
                        child: const Text("Sign UP")),
                    DView.spaceHeight(),
                    ElevatedButton(
                        onPressed: () async {
                          createAccount();
                        },
                        child: Text("Already Have an Account"))
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
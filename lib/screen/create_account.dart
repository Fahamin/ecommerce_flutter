import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import 'login_screen.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late TextEditingController emialcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController phonecontroller;
  late TextEditingController namecontroller;
  late TextEditingController confimcontroller;

  @override
  void initState() {
    emialcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    phonecontroller = TextEditingController();
    namecontroller = TextEditingController();
    confimcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Appcolors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  // this is image

                  const Positioned(
                    top: 20,
                    left: 1,
                    right: 1,
                    child: Image(
                        height: 100,
                        width: 100,
                        image: AssetImage(
                            "assets/images/monarch_mart.png")),
                  ),

                  // this is backbutton
                  Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Appcolors.scaffoldBGColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DView.spaceHeight(100),

                        // this is text creat account
                        const Text(
                          AppString.creatAnAccount,
                          style: TextStyle(color: Appcolors.scaffoldBGColor),
                        ),
                      DView.spaceHeight(20),
                      
                        // this is textfield - enter your name

                        TextField(
                          controller: namecontroller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Appcolors.primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Appcolors.primaryColor),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your name",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      DView.spaceHeight(10),
                      
                        // this is textfield - enter your phone

                        TextField(
                          controller: phonecontroller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Appcolors.primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Appcolors.primaryColor),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your phone",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                                               DView.spaceHeight(10),

                        // this is textfield - enter your email

                        TextField(
                          controller: emialcontroller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Appcolors.primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Appcolors.primaryColor),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your email",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                                               DView.spaceHeight(10),

                        // this is textfield - enter your password

                        TextField(
                          controller: passwordcontroller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Appcolors.primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Appcolors.primaryColor),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your password",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                                               DView.spaceHeight(10),

                        // this is textfield - enter your confirm password

                        TextField(
                          controller: confimcontroller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Appcolors.primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Appcolors.primaryColor),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your confirm password ",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              // this is elevated button - creat account button
              Consumer(
                builder: (context, ref, child) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (confimcontroller.text.isEmpty ||
                          passwordcontroller.text.isEmpty ||
                          namecontroller.text.isEmpty ||
                          phonecontroller.text.isEmpty ||
                          emialcontroller.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Filed is empty");
                      } else {
                        if (passwordcontroller.text == confimcontroller.text) {
                          var ff =
                          DateTime.now().millisecondsSinceEpoch.toString();
                          var dd = DateTime.now()
                              .toString()
                              .split(" ")[0]
                              .split("-")
                              .join()
                              .toString();

                          var result = ff + dd;
                          var CreateAccountUserInput = CreateAccountUserInput(
                              userid: result.toString(),
                              fullname: namecontroller.text.toString(),
                              email: emialcontroller.text.toString(),
                              phone: phonecontroller.text.toString(),
                              password: passwordcontroller.text.toString(),
                              gender: "no need",
                              address: "no need",
                              country: "country",
                              city: "city",
                              pincode: "pincode");
                          ref
                              .read(authProvider.notifier)
                              .userCreateAccount(CreateAccountUserInput,context);

                          namecontroller.text = "";
                          emialcontroller.text = "";
                          passwordcontroller.text = "";
                          phonecontroller.text = "";
                          confimcontroller.text = "";
                        } else {
                          Fluttertoast.showToast(msg: "password not match");
                        }
                      }
                    },
                    child: const Center(
                        child: Text(
                          "Creat an Account",
                          style: TextStyle(color: Appcolors.scaffoldBGColor),
                        )),
                  ),
                ),
              ),

              // this is elevated button - Already registered button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                            (route) => false);
                  },
                  child: const Center(
                      child: Text(
                        "Already registered",
                        style: TextStyle(color: Appcolors.scaffoldBGColor),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


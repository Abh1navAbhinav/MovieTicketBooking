import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/home/view/home_page.dart';
import 'package:ticket_booking/main.dart';

class LoginController extends GetxController {
  //Boolean values

  RxBool isCreatedNewAccount = false.obs;
  RxBool isPasswordVisibleLogin = false.obs;
  RxBool isPasswordVisibleSignin = false.obs;
  RxBool isTextFieldClicked = false.obs;
  RxBool isTextFieldClicked2 = false.obs;
  RxBool isOTpRegistration = true.obs;
  RxBool isLoginButtonPressed = false.obs;
  RxBool isDividerSize = false.obs;

  // other variable declaration

  RxString buttonValue = "Login".obs;

  //form key
  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormkey = GlobalKey<FormState>();

  // focus nodes

  FocusNode textfieldFocusNode = FocusNode();

  //RegExp validation
  RegExp emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  RegExp passwordValid = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()~_`><,.|/]).{8,}$');

  //Text editing controllers

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUPMobileController = TextEditingController();
  TextEditingController signUpUsernameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmController = TextEditingController();
  TextEditingController otpSignUpController = TextEditingController();

  //colors

  Rx<Color> loginButtonColor = kColor2.obs;

  //functions

  nextButtonOnPress() async {
    if (signupFormkey.currentState!.validate()) {
      loginButtonColor.value = Colors.green;

      await Future.delayed(
        const Duration(milliseconds: 1000),
      );

      isOTpRegistration.value = false;
      loginButtonColor.value = kColor2;
    } else {
      loginButtonColor.value = Colors.red;
    }
  }

  loginButtonOnPressed() async {
    if (loginFormkey.currentState!.validate()) {
      loginButtonColor.value = Colors.green;
      await Future.delayed(
        const Duration(milliseconds: 1000),
      );
      Get.to(
        () => const HomePage(),
      );
    } else {
      loginButtonColor.value = Colors.red;
    }
  }

  signUpButtonOnPressed() async {
    if (otpFormkey.currentState!.validate()) {
      loginButtonColor.value = Colors.green;
      await Future.delayed(
        const Duration(milliseconds: 1000),
      );

      Get.to(
        () => const HomePage(),
      );
    } else {
      loginButtonColor.value = Colors.red;
    }
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    isDividerSize.value = true;
    log("onInit");
    super.onInit();
  }
}

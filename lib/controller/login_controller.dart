import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/config/endpoints.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/login/login_response.dart';
import 'package:ticket_booking/model/otp/otp_response.dart';
import 'package:ticket_booking/model/register/register_response.dart';
import 'package:ticket_booking/services/login_and_signup.dart';
import 'package:ticket_booking/view/bottom_navigation/bottom_screen.dart';

class LoginController extends GetxController {
  //Boolean values

  RxBool isCreatedNewAccount = false.obs;
  RxBool isPasswordVisibleLogin = false.obs;
  RxBool isPasswordVisibleSignin = false.obs;
  RxBool isTextFieldClicked1 = false.obs;
  RxBool isTextFieldClicked2 = false.obs;
  RxBool isTextFieldClicked3 = false.obs;
  RxBool isTextFieldClicked4 = false.obs;
  RxBool isTextFieldClicked5 = false.obs;
  RxBool isTextFieldClicked6 = false.obs;
  RxBool isOTpRegistration = true.obs;
  RxBool isLoginButtonPressed = false.obs;
  RxBool isDividerSize = false.obs;
  RxBool isLoading = false.obs;

  // other variable declaration

  RxString buttonValue = "Login".obs;

  //form key
  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormkey = GlobalKey<FormState>();

  // focus nodes

  FocusNode eMailTextfieldFocusNode = FocusNode();

  //RegExp validation
  RegExp emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  RegExp passwordValid = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()~_`><,.|/]).{8,}$');

  //Text editing controllers

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmController = TextEditingController();
  TextEditingController otpSignUpController = TextEditingController();

  //colors

  Rx<Color> loginButtonColor = constantObj.kColor40.obs;

  //service variable
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  // String id = '';

  //functions

  nextButtonOnPress() async {
    if (signupFormkey.currentState!.validate()) {
      String email = signUpEmailController.text.trim();
      String password = signUpPasswordController.text.trim();
      isLoading.value = true;
      EmailSignupRespones? respones =
          await ApiServices().signupEmail(email, password);
      isLoading.value = false;
      if (respones != null) {
        if (respones.error == true) {
          loginButtonColor.value = Colors.green;
          Fluttertoast.showToast(
            msg: 'OTP send to ${signUpEmailController.text.trim()}',
          );
          await Future.delayed(const Duration(milliseconds: 2000));
          isOTpRegistration.value = false;
          loginButtonColor.value = constantObj.kColor40;
          final SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('user_id', respones.id!);
          // constantObj.getSnackbarMethod(
          //   message: 'OTP send to ${signUpEmailController.text.trim()}',
          // );

        } else {
          loginButtonColor.value = Colors.red;
          constantObj.getSnackbarMethod(
            message: 'User with same E-mail All ready exist',
          );
          log(respones.message.toString());
        }
      } else {
        loginButtonColor.value = Colors.red;
        log("response is null");
      }
    } else {
      loginButtonColor.value = Colors.red;
      constantObj.getSnackbarMethod(message: 'Enter all the details carefully');
    }
  }

  loginButtonOnPressed() async {
    if (loginFormkey.currentState!.validate()) {
      String mail = loginEmailController.text.trim();
      String password = loginPasswordController.text.trim();
      isLoading.value = true;
      EmailLoginRespones? response =
          await ApiServices().emailLogin(mail, password);
      isLoading.value = false;
      if (response != null) {
        if (response.error == true) {
          loginButtonColor.value = Colors.green;
          await Future.delayed(const Duration(milliseconds: 500));
          constantObj.getSnackbarMethod(
            message: 'processing....',
            success: true,
          );
          await Future.delayed(const Duration(milliseconds: 2500));
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('token', response.token!);

          Get.offAll(
            () => BottomNavigationScreen(),
          );
        } else {
          loginButtonColor.value = Colors.red;
        }
      } else {
        log('response is null');
      }
    } else {
      loginButtonColor.value = Colors.red;
      constantObj.getSnackbarMethod(message: 'All field is required');
    }
  }

  signUpButtonOnPressed() async {
    if (otpFormkey.currentState!.validate()) {
      String otp = otpSignUpController.text.trim();
      final SharedPreferences storage = await SharedPreferences.getInstance();
      isLoading.value = true;
      final userId = storage.getString('user_id');
      EmailVerifyRespones? responses =
          await ApiServices().verifyEmailOtp(otp, userId!);
      isLoading.value = false;
      if (responses != null) {
        if (responses.error == true) {
          storage.setString('refreshToken', responses.refreshToken!);
          storage.setString('token', responses.token!);
          loginButtonColor.value = Colors.green;
          await Future.delayed(const Duration(milliseconds: 1000));
          isOTpRegistration.value = false;
          constantObj.getSnackbarMethod(
            message: 'processing....',
            success: true,
          );
          await Future.delayed(const Duration(milliseconds: 3000));
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setBool('userLoggedIn', true);
          Get.offAll(
            () => BottomNavigationScreen(),
          );
          loginButtonColor.value = constantObj.kColor40;
        } else {
          loginButtonColor.value = Colors.red;
          constantObj.getSnackbarMethod(message: 'OTP entered is invalid');
        }
      } else {
        log("responses is null");
      }
    } else {
      loginButtonColor.value = Colors.red;
      constantObj.getSnackbarMethod(message: 'Complete the OTP');
    }
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    isDividerSize.value = true;
    super.onInit();
  }
}

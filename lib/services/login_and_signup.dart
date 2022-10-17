import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/config/endpoints.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/login/login_response.dart';
import 'package:ticket_booking/model/otp/otp_response.dart';
import 'package:ticket_booking/model/register/register_response.dart';

class ApiServices {
  final logincontroller = Get.put(LoginController());

  //--------------------Email Signup-----------------------

  Future<EmailSignupRespones?> signupEmail(
    String email,
    String password,
  ) async {
    Map<String, String> data = {"user_mail": email, "user_password": password};
    try {
      final response =
          await logincontroller.dio.post(EndPoints.signupEmail, data: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return EmailSignupRespones.fromJson(response.data);
      }
    } catch (e) {
      return EmailSignupRespones(
          error: false, message: constantObj.errorHandler(e));
    }
    return null;
  }

//--------------------Email Otp Verification-----------------------

  Future<EmailVerifyRespones?> verifyEmailOtp(
    String otp,
    String id,
  ) async {
    Map<String, dynamic> data = {"user_otp": otp, "_id": id};
    try {
      final response =
          await logincontroller.dio.post(EndPoints.emailOtpVerify, data: data);
      Fluttertoast.showToast(msg: response.data["message"]);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return EmailVerifyRespones.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      return EmailVerifyRespones(
          error: false, message: constantObj.errorHandler(e));
    }
    return null;
  }

//--------------------Email Login-----------------------

  Future<EmailLoginRespones?> emailLogin(
    String mail,
    String password,
  ) async {
    Map<String, dynamic> data = {"user_mail": mail, "user_password": password};
    try {
      final response =
          await logincontroller.dio.post(EndPoints.loginEmail, data: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return EmailLoginRespones.fromJson(response.data);
      }
    } catch (e) {
      return EmailLoginRespones(
          error: false, message: constantObj.errorHandler(e));
    }
    return null;
  }
}

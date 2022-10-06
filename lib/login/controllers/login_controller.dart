import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //Boolean values

  RxBool isCreatedNewAccount = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isTextFieldClicked = false.obs;
  RxBool isTextFieldClicked2 = false.obs;
  RxBool isOTpRegistration = true.obs;

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
}

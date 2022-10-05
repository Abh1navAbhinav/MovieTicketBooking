import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isCreatedNewAccount = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isTextFieldClicked = false.obs;
  RxBool isTextFieldClicked2 = false.obs;
  RxString buttonValue = "Login".obs;
  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  RegExp passwordValid = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()~_`><,.|/]).{8,}$');
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUPEmailController = TextEditingController();
  TextEditingController signUpUsernameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmController = TextEditingController();
}

import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isCreatedNewAccount = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isTextFieldClicked = false.obs;
  RxBool isTextFieldClicked2 = false.obs;
  RxString buttonValue = "Login".obs;
}

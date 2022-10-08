import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/main.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: controller.isCreatedNewAccount.value
            ? (controller.isOTpRegistration.value
                ? controller.nextButtonOnPress
                : controller.signUpButtonOnPressed)
            : controller.loginButtonOnPressed,
        //
        child: Material(
          elevation: 5,
          shadowColor: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: controller.loginButtonColor.value,
            ),
            height: 50,
            width: controller.isCreatedNewAccount.value
                ? (!controller.isOTpRegistration.value ? 150 : 250)
                : 100,
            child: Center(
              child: Text(
                controller.isCreatedNewAccount.value
                    ? (controller.isOTpRegistration.value ? "Next" : 'Sign Up')
                    : 'Login',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: controller.loginButtonColor.value,
              ),
              height: 50,
              width: 100,
              child: Center(
                child: Obx(
                  () => Text(
                    controller.isCreatedNewAccount.value
                        ? (controller.isOTpRegistration.value
                            ? "Next"
                            : 'Sign Up')
                        : 'Login',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

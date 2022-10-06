import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/home/view/home_page.dart';
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
                ? () {
                    if (controller.signupFormkey.currentState!.validate()) {
                      //this is the next button on press function

                      controller.isOTpRegistration.value = false;
                      log('nextbutton');
                    }
                  }
                : () {
                    // this is the signUp button on press function
                    log('signup button');
                    Get.to(
                      const HomePage(),
                    );
                  })
            : (() {
                if (controller.loginFormkey.currentState!.validate()) {
                  // this is the login button on press function
                  log('Login button');
                  Get.to(
                    () => const HomePage(),
                  );
                }
              }),
        child: Material(
          elevation: 5,
          shadowColor: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kColor2,
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
    );
  }
}

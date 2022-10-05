import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/main.dart';

class CreateAndForgotAccount extends GetView<LoginController> {
  const CreateAndForgotAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            controller.isCreatedNewAccount.value = true;
            // controller.buttonValue.value = "Sign Up";
          },
          child: Column(
            children: [
              Text(
                'Create new Account',
                style: ktextStyle,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot password?',
            style: ktextStyle,
          ),
        ),
      ],
    );
  }
}

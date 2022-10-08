import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/main.dart';

class CreateNewAccountButton extends GetView<LoginController> {
  const CreateNewAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.isCreatedNewAccount.value = true;
        controller.loginButtonColor.value = kColor2;
      },
      //
      child: Material(
        elevation: 5,
        shadowColor: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kColor2,
          ),
          height: 50,
          width: 250,
          child: Center(
            child: FittedBox(
              child: Text(
                'Create new account',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/login/view/widgets/create_and_forgot_account.dart';
import 'package:ticket_booking/login/view/widgets/login_text_form_field.dart';
import 'package:ticket_booking/main.dart';

class LoginAccount extends GetView<LoginController> {
  const LoginAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          LoginTextFormField(
            hintText: 'E-Mail',
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            containerColor: kColor2,
            textColor: kColor1,
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => LoginTextFormField(
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.isPasswordVisible.value,
              textColor: kColor1,
              containerColor: kColor2,
              isPasswordField: IconButton(
                onPressed: () {
                  controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value;
                },
                icon: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: controller.isPasswordVisible.value
                      ? Colors.black54
                      : Colors.black38,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CreateAndForgotAccount(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/view/login/widgets/forgot_account.dart';
import 'package:ticket_booking/view/login/widgets/login_text_form_field.dart';

class LoginAccount extends GetView<LoginController> {
  const LoginAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Form(
        key: controller.loginFormkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginTextFormField(
              isTextFieldClicked: controller.isTextFieldClicked1,
              textEditingController: controller.loginEmailController,
              hintText: 'E-mail',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              containerColor: constantObj.kColor30,
              textColor: const Color.fromARGB(255, 242, 244, 246),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'E-mail is required';
                }
                if (!controller.emailValid.hasMatch(value)) {
                  return 'E-mail is not valid';
                }
                return null;
              },
            ),
            Obx(
              () => LoginTextFormField(
                isTextFieldClicked: controller.isTextFieldClicked2,
                textEditingController: controller.loginPasswordController,
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: !controller.isPasswordVisibleLogin.value,
                textColor: const Color.fromARGB(255, 242, 244, 246),
                containerColor: constantObj.kColor30,
                isPasswordField: IconButton(
                  onPressed: () {
                    controller.isPasswordVisibleLogin.value =
                        !controller.isPasswordVisibleLogin.value;
                  },
                  icon: Icon(
                    controller.isPasswordVisibleLogin.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: controller.isPasswordVisibleLogin.value
                        ? Colors.black54
                        : Colors.black38,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (!controller.passwordValid.hasMatch(value)) {
                    return 'Please enter a strong password';
                  }
                  return null;
                },
              ),
            ),
            const ForgotAccountButton(),
          ],
        ),
      ),
    );
  }
}

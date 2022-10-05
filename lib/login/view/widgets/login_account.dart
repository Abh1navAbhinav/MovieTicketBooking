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
      height: 350,
      child: Form(
        key: controller.loginFormkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => AnimatedPhysicalModel(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                elevation: controller.isTextFieldClicked2.value ? 5 : 0,
                color: Colors.amber,
                duration: const Duration(
                  seconds: 1,
                ),
                shadowColor: Colors.blue,
                child: LoginTextFormField(
                  textEditingController: controller.loginEmailController,
                  hintText: 'E-Mail',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  containerColor: kColor2,
                  textColor: kColor1,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.isTextFieldClicked2.value = true;
                    } else {
                      controller.isTextFieldClicked2.value = false;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'E-Mail should not be empty';
                    } else if (!controller.emailValid.hasMatch(value) ||
                        value.contains(' ')) {
                      return 'E-Mail is not valid';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => AnimatedPhysicalModel(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                elevation: controller.isTextFieldClicked.value ? 5 : 0,
                color: Colors.amber,
                duration: const Duration(
                  seconds: 1,
                ),
                shadowColor: Colors.blue,
                child: LoginTextFormField(
                  textEditingController: controller.loginPasswordController,
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
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.isTextFieldClicked.value = true;
                    } else {
                      controller.isTextFieldClicked.value = false;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password should not be empty';
                    } else if (!controller.passwordValid.hasMatch(value)) {
                      return 'Please enter a strong password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CreateAndForgotAccount(),
          ],
        ),
      ),
    );
  }
}

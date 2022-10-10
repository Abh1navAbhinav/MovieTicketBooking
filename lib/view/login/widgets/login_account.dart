import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/view/login/view/widgets/forgot_account.dart';
import 'package:ticket_booking/view/login/view/widgets/login_text_form_field.dart';
import 'package:ticket_booking/main.dart';

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
            Obx(
              () => AnimatedPhysicalModel(
                borderRadius: BorderRadius.circular(14),
                shape: BoxShape.rectangle,
                elevation: controller.isTextFieldClicked2.value ? 4 : 0,
                color: Colors.amber,
                duration: const Duration(
                  seconds: 1,
                ),
                shadowColor: Colors.cyan,
                child: LoginTextFormField(
                  textEditingController: controller.loginEmailController,
                  hintText: 'Username',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  containerColor: kColor30,
                  textColor: const Color.fromARGB(255, 242, 244, 246),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.isTextFieldClicked2.value = true;
                    } else {
                      controller.isTextFieldClicked2.value = false;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    if (value.length < 3 || value.contains(' ')) {
                      return 'Username is not valid';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => AnimatedPhysicalModel(
                borderRadius: BorderRadius.circular(14),
                shape: BoxShape.rectangle,
                elevation: controller.isTextFieldClicked.value ? 4 : 0,
                color: Colors.amber,
                duration: const Duration(
                  seconds: 1,
                ),
                shadowColor: const Color.fromARGB(255, 0, 225, 255),
                child: LoginTextFormField(
                  textEditingController: controller.loginPasswordController,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !controller.isPasswordVisibleLogin.value,
                  textColor: const Color.fromARGB(255, 242, 244, 246),
                  containerColor: kColor30,
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
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.isTextFieldClicked.value = true;
                    } else {
                      controller.isTextFieldClicked.value = false;
                    }
                  },
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
            ),
            const ForgotAccountButton(),
          ],
        ),
      ),
    );
  }
}

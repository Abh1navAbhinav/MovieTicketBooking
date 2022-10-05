import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/login/view/widgets/login_text_form_field.dart';
import 'package:ticket_booking/main.dart';

class CreateNewAccount extends GetView<LoginController> {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            shadowColor: Colors.blue,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kColor2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.signupFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoginTextFormField(
                        textEditingController:
                            controller.signUpUsernameController,
                        hintText: 'Username',
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        containerColor: kColor1,
                        textColor: kColor2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username should not be empty';
                          }
                          return null;
                        },
                      ),
                      LoginTextFormField(
                        textEditingController: controller.signUPEmailController,
                        hintText: 'E-Mail',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        containerColor: kColor1,
                        textColor: kColor2,
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
                      Obx(
                        () => LoginTextFormField(
                          textEditingController:
                              controller.signUpPasswordController,
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !controller.isPasswordVisible.value,
                          containerColor: kColor1,
                          textColor: kColor2,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password should not be empty';
                            } else if (!controller.passwordValid
                                .hasMatch(value)) {
                              return 'Please enter a strong password';
                            }
                            return null;
                          },
                        ),
                      ),
                      LoginTextFormField(
                        textEditingController:
                            controller.signUpConfirmController,
                        hintText: 'Confirm Password',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        containerColor: kColor1,
                        textColor: kColor2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password should not be empty';
                          } else if (value !=
                              controller.signUpPasswordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              controller.isCreatedNewAccount.value = false;
              // controller.buttonValue.value = 'Login';
            },
            child: Text(
              'Go back to Login',
              style: ktextStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

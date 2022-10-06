import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.blue,
            child: Container(
              // height: 300,
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
                      const SizedBox(
                        height: 10,
                      ),
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
                            return 'Username is required';
                          }
                          if (value.length < 3) {
                            return 'Insufficient length';
                          }
                          if (value.contains(' ')) {
                            return 'Remove all whiteSpaces';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginTextFormField(
                        textEditingController:
                            controller.signUPMobileController,
                        hintText: 'Mobile number',
                        keyboardType: TextInputType.phone,
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        obscureText: false,
                        containerColor: kColor1,
                        textColor: kColor2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile is required';
                          }
                          if (value.length != 10) {
                            return 'Moblie is not valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => LoginTextFormField(
                          textEditingController:
                              controller.signUpPasswordController,
                          hintText: 'New Password',
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
                              return 'Password is required';
                            }
                            if (!controller.passwordValid.hasMatch(value)) {
                              return 'Please enter a strong password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                            return 'Confirm password is required';
                          }
                          if (value !=
                              controller.signUpPasswordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
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

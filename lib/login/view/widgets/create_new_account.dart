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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginTextFormField(
                      hintText: 'Username',
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      containerColor: kColor1,
                      textColor: kColor2,
                    ),
                    LoginTextFormField(
                      hintText: 'E-Mail',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      containerColor: kColor1,
                      textColor: kColor2,
                    ),
                    Obx(
                      () => LoginTextFormField(
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
                      ),
                    ),
                    LoginTextFormField(
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      containerColor: kColor1,
                      textColor: kColor2,
                    ),
                  ],
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

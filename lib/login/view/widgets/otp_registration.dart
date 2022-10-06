import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/login/view/widgets/login_text_form_field.dart';
import 'package:ticket_booking/main.dart';

class OtpRegistration extends GetView<LoginController> {
  const OtpRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.blue,
            child: AnimatedContainer(
              duration: const Duration(
                seconds: 1,
              ),
              curve: Curves.easeIn,
              // height: 260,
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
                            return 'Username should not be empty';
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
              controller.isOTpRegistration.value = true;
              // controller.buttonValue.value = 'Login';
            },
            child: Text(
              'Change Mobile number',
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

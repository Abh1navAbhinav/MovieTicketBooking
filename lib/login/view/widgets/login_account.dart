import 'package:flutter/material.dart';
import 'package:ticket_booking/login/view/widgets/create_and_forgot_account.dart';
import 'package:ticket_booking/login/view/widgets/login_text_form_field.dart';
import 'package:ticket_booking/main.dart';

class LoginAccount extends StatelessWidget {
  const LoginAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          LoginTextFormField(
            hintText: ' E-Mail',
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            containerColor: kColor2,
            textColor: kColor1,
          ),
          const SizedBox(
            height: 30,
          ),
          LoginTextFormField(
            hintText: ' Password',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            textColor: kColor1,
            containerColor: kColor2,
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

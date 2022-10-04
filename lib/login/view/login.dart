import 'package:flutter/material.dart';
import 'package:ticket_booking/login/view/widgets/login_text_form_field.dart';
import 'package:ticket_booking/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            const LoginTextFormField(
              hintText: ' E-Mail',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            const LoginTextFormField(
              hintText: ' Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ],
        ),
      ),
      bottomSheet: Container(),
    );
  }
}

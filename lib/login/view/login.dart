import 'package:flutter/material.dart';
import 'package:ticket_booking/login/view/widgets/create_and_forgot_account.dart';
import 'package:ticket_booking/login/view/widgets/login_button.dart';
import 'package:ticket_booking/login/view/widgets/login_text_form_field.dart';
import 'package:ticket_booking/login/view/widgets/social_media_icon.dart';
import 'package:ticket_booking/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const LoginTextFormField(
                hintText: ' E-Mail',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              const SizedBox(
                height: 30,
              ),
              const LoginTextFormField(
                hintText: ' Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const CreateAndForgotAccount(),
              const SizedBox(
                height: 70,
              ),
              const LoginButton(),
              const SizedBox(
                height: 50,
              ),
              Text(
                'or',
                style: ktextStyle,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SocialMediaIcon(image: 'assets/icons/facebook.png'),
                  SocialMediaIcon(image: 'assets/icons/google.png'),
                  SocialMediaIcon(image: 'assets/icons/twitter.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

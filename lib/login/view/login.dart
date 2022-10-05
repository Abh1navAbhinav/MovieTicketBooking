import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/login/view/widgets/create_new_account.dart';
import 'package:ticket_booking/login/view/widgets/login_account.dart';
import 'package:ticket_booking/login/view/widgets/login_button.dart';
import 'package:ticket_booking/login/view/widgets/social_media_icon.dart';
import 'package:ticket_booking/main.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Obx(
                  () => AnimatedCrossFade(
                    firstChild: const CreateNewAccount(),
                    secondChild: const LoginAccount(),
                    crossFadeState: controller.isCreatedNewAccount.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500),
                    firstCurve: Curves.easeInOutCubicEmphasized,
                    secondCurve: Curves.easeInOutQuart,
                  ),
                ),
                Obx(
                  () => SizedBox(
                    height: controller.isCreatedNewAccount.value ? 5 : 70,
                  ),
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
      ),
    );
  }
}

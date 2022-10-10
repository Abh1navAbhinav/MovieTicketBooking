import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/login/view/widgets/create_new_account.dart';
import 'package:ticket_booking/login/view/widgets/createnewaccount.dart';
import 'package:ticket_booking/login/view/widgets/login_account.dart';
import 'package:ticket_booking/login/view/widgets/login_button.dart';
import 'package:ticket_booking/login/view/widgets/login_text.dart';
import 'package:ticket_booking/login/view/widgets/otp_registration.dart';
import 'package:ticket_booking/main.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image:
                AssetImage('assets/images/movie-objects-whita-background.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 244, 246),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Obx(
                    () => AnimatedCrossFade(
                      firstChild: !controller.isOTpRegistration.value
                          ? const LoginText(
                              text1: 'OTP Re',
                              text2: 'g',
                              text3: 'istration',
                              fontSize: 40,
                            )
                          : const LoginText(
                              text1: 'Si',
                              text2: 'g',
                              text3: 'n up',
                              fontSize: 50,
                            ),
                      secondChild: const LoginText(
                        text1: 'Lo',
                        text2: 'g',
                        text3: 'in',
                        fontSize: 70,
                      ),
                      crossFadeState: controller.isCreatedNewAccount.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200),
                      firstCurve: Curves.decelerate,
                      secondCurve: Curves.easeInOutQuart,
                    ),
                  ),
                  Obx(
                    () => AnimatedCrossFade(
                      firstChild: !controller.isOTpRegistration.value
                          ? const OtpRegistration()
                          : const CreateNewAccount(),
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
                    () => controller.isCreatedNewAccount.value
                        ? const SizedBox(
                            height: 50,
                          )
                        : const SizedBox(),
                  ),
                  const LoginButton(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 5,
                  ),
                  Obx(
                    () => controller.isOTpRegistration.value
                        ? AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      width: !controller.isDividerSize.value
                                          ? 0
                                          : MediaQuery.of(context).size.width /
                                              3,
                                      child: const Divider(
                                        thickness: 1,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Text(
                                      '   or   ',
                                      style: ktextStyle,
                                    ),
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      width: !controller.isDividerSize.value
                                          ? 0
                                          : MediaQuery.of(context).size.width /
                                              3,
                                      child: const Divider(
                                        thickness: 1,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                /*    Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    SocialMediaIcon(
                                        image: 'assets/icons/facebook.png'),
                                    SocialMediaIcon(
                                        image: 'assets/icons/google.png'),
                                    SocialMediaIcon(
                                        image: 'assets/icons/twitter.png'),
                                  ],
                                ), */
                                // const SizedBox(
                                //   height: 80,
                                // ),
                                Obx(
                                  () => !controller.isCreatedNewAccount.value
                                      ? const CreateNewAccountText(
                                          firstText: 'Don\'t have an account.',
                                          secondText: 'Sign UP',
                                        )
                                      : const CreateNewAccountText(
                                          firstText:
                                              'Remember my account go back to.',
                                          secondText: 'Login',
                                        ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

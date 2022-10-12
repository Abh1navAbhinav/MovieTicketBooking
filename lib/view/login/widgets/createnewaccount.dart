import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';

class CreateNewAccountText extends GetView<LoginController> {
  const CreateNewAccountText({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: GoogleFonts.akayaKanadaka(
          fontSize: 20,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: GoogleFonts.akayaKanadaka(
              fontSize: 20,
              color: constantObj.kColor40,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                controller.isCreatedNewAccount.value =
                    !controller.isCreatedNewAccount.value;
                controller.loginButtonColor.value = constantObj.kColor40;
              },
          ),
        ],
      ),
    );
  }
}

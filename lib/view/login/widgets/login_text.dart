import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';

class LoginText extends GetView<LoginController> {
  const LoginText({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.fontSize,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String text3;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: RichText(
        text: TextSpan(
          text: text1,
          style: GoogleFonts.aladin(
            fontSize: fontSize,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: text2,
              style: GoogleFonts.adamina(
                fontSize: fontSize,
                color: constantObj.kColor40,
              ),
            ),
            TextSpan(
              text: text3,
              style: GoogleFonts.aladin(
                fontSize: fontSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

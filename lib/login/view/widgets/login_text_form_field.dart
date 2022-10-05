import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginTextFormField extends GetView<LoginController> {
  LoginTextFormField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.containerColor,
    required this.textColor,
    this.isPasswordField,
    this.onChanged,
  }) : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color containerColor;
  final Color textColor;
  Widget? isPasswordField;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          top: 2,
        ),
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
              color: textColor,
            ),
            suffixIcon: isPasswordField,
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}

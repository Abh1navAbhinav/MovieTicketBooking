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
    required this.textEditingController,
    this.isPasswordField,
    this.onChanged,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color containerColor;
  final Color textColor;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;

  Widget? isPasswordField;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          // top: 10,
        ),
        child: TextFormField(
          controller: textEditingController,
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
          validator: validator,
        ),
      ),
    );
  }
}

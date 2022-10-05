import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.containerColor,
    required this.textColor,
  }) : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color containerColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: textColor,
          ),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/main.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
  }) : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: kColor2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: kColor1,
          ),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

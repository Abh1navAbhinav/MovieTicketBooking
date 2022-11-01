import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingsDescriptions extends StatelessWidget {
  const HeadingsDescriptions({Key? key, required this.heading})
      : super(key: key);
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedContainer(
        color: Colors.lightGreen.withOpacity(.1),
        duration: const Duration(seconds: 1),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            heading,
            style: GoogleFonts.adamina(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

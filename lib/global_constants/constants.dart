import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final constantObj = GlobalConstants();

class GlobalConstants {
//Global Constant Values

//Color
// Color kColor1 = const Color.fromARGB(255, 242, 244, 246);
// Color kColor2 = const Color.fromARGB(255, 175, 201, 220);
  Color kColor40 = const Color.fromARGB(255, 172, 142, 248);
  Color kColor30 = const Color.fromARGB(255, 207, 172, 249);
  Color kColor20 = const Color.fromARGB(255, 231, 212, 250);
  Color kColor10 = const Color.fromARGB(255, 247, 229, 253);

//TextStyle
  TextStyle kButtonTextStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: const Color.fromARGB(255, 242, 244, 246),
  );
  TextStyle ktextStyle = GoogleFonts.roboto(
    color: Colors.black,
  );
}

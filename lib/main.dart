import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/login/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 0, 225, 255),
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoginPage(),
    );
  }
}

//Global Constant Values

//Color
Color kColor2 = const Color.fromARGB(255, 242, 244, 246);
Color kColor1 = const Color.fromARGB(255, 175, 201, 220);

//TextStyle
TextStyle kButtonTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.bold,
  fontSize: 25,
  color: kColor1,
);
TextStyle ktextStyle = GoogleFonts.roboto(
  color: Colors.black,
);

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/splash_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  SplashScreen({super.key});
  final splashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            'SplashScreen',
            style: GoogleFonts.aladin(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 251, 127, 239),
            ),
          ),
        ),
      ),
    );
  }
}

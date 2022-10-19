import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/search_controller.dart';

class Greetings extends GetView<SearchPageController> {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: controller.isSearchClicked.value ? 0 : 1,
        child: Text(
          controller.greeting(),
          style: GoogleFonts.aladin(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/view/home_page/widgets/near_you_image.dart';

class NearYouList extends GetView<HomeController> {
  const NearYouList({super.key, required this.heading, required this.indexs});
  final String heading;
  final int indexs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "  $heading",
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: SizedBox(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: controller.carouselItemImage.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => NearYouImage(indexs: index),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

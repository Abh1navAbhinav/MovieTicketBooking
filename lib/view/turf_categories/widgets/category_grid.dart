import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/home_page/widgets/near_you_image.dart';
import 'package:ticket_booking/view/turf_description/turf_description.dart';

class CategoryGrid extends GetView<HomeController> {
  const CategoryGrid({
    super.key,
    required this.data,
  });
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(
                  TurfDescription(datum: data),
                );
              },
              child: NearYouImage(
                image: data.turfLogo!,
                name: data.turfName!,
                rating: data.turfInfo!.turfRating!,
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

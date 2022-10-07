import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/home/controllers/home_controller.dart';
import 'package:ticket_booking/home/view/widgets/grid_images.dart';

class HomePageHorizontalItems extends GetView<HomeController> {
  const HomePageHorizontalItems({
    super.key,
    required this.gridHeading,
  });
  final String gridHeading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              gridHeading,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.carouselItemImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridImages(
                    image: controller.carouselItemImage[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/view/category_list/categorylist.dart';
import 'package:ticket_booking/view/home_page/widgets/turfs_type_selection.dart';

class CarouselSliderWidget extends GetView<HomeController> {
  CarouselSliderWidget({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        CarouselSlider.builder(
          itemCount: controller.carouselItemImage.length,
          options: CarouselOptions(
            // autoPlayCurve: Curves.easeInOutQuad,
            autoPlay: true,
            aspectRatio: 9 / 4,
            autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            autoPlayInterval: const Duration(milliseconds: 5000),
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            initialPage: 1,
          ),
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () async {
                final image = controller.carouselItemImage[index];
                Get.to(() => CategoryList(image: image));
                log('tapped index $index');
              },
              child: TurfTypeSelection(index: index),
            );
          },
        ),
      ],
    );
  }
}

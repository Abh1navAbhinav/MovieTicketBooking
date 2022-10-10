import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';

class CarouselSliderWidget extends GetView<HomeController> {
  CarouselSliderWidget({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.carouselItemImage.length,
      options: CarouselOptions(
        // autoPlayCurve: Curves.easeInOutQuad,
        autoPlay: true,
        aspectRatio: 6 / 4,
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        autoPlayInterval: const Duration(milliseconds: 3500),
        viewportFraction: 1,
        initialPage: 1,
      ),
      itemBuilder: (context, index, realIndex) {
        return SizedBox(
          height: 500,
          width: double.infinity,
          child: Image(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              controller.carouselItemImage[index],
            ),
          ),
        );
      },
    );
  }
}

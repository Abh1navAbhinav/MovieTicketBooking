import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/view/home_page/widgets/turfs_type_selection.dart';

class CarouselSliderWidgetInDescription extends GetView<HomeController> {
  CarouselSliderWidgetInDescription({super.key, required this.image});
  final homeController = Get.put(HomeController());
  final List<String> image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        CarouselSlider.builder(
          itemCount: image.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 9 / 4,
            autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            autoPlayInterval: const Duration(milliseconds: 5000),
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            initialPage: 1,
          ),
          itemBuilder: (context, index, realIndex) {
            return TurfTypeSelection(
              index: index,
              image: NetworkImage(
                image[index],
              ),
            );
          },
        ),
      ],
    );
  }
}

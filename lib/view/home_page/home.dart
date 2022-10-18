import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/view/home_page/widgets/carousel_slider.dart';
import 'package:ticket_booking/view/home_page/widgets/home_list_grid.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final homePageController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSliderWidget(),
        const SizedBox(height: 50),
        const HomeListGrid(
          heading: 'FootBall',
          indexs: 1,
        ),
        const SizedBox(height: 15),
        const HomeListGrid(
          heading: 'Cricket',
          indexs: 0,
        ),
        const SizedBox(height: 15),
        const HomeListGrid(
          heading: 'Badminton',
          indexs: 2,
        ),
        const SizedBox(height: 15),
        const HomeListGrid(
          heading: 'Yoga',
          indexs: 3,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

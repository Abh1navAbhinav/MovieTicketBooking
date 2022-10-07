import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/home/controllers/home_controller.dart';
import 'package:ticket_booking/home/view/widgets/carousel_slider.dart';
import 'package:ticket_booking/home/view/widgets/horizontal_items.dart';
import 'package:ticket_booking/main.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return /* Scaffold(
      backgroundColor: kColor1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSliderWidget(),
          const SizedBox(
            height: 20,
          ),
          const HomePageHorizontalItems(),
        ],
      ),
    ); */
        Scaffold(
      backgroundColor: kColor1,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 202,
            backgroundColor: Colors.black,
            floating: true,
            shadowColor: Colors.blue,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: CarouselSliderWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                HomePageHorizontalItems(
                  gridHeading: 'Top Trending',
                ),
                HomePageHorizontalItems(
                  gridHeading: 'Up Comming',
                ),
                HomePageHorizontalItems(
                  gridHeading: 'Screen 1',
                ),
                HomePageHorizontalItems(
                  gridHeading: 'Screen 2',
                ),
                HomePageHorizontalItems(
                  gridHeading: 'House Full',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
    return RefreshIndicator(
      onRefresh: () async {
        return controller.carouselItemImage.shuffle();
      },
      child: Scaffold(
        backgroundColor: kColor10,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 202,
              backgroundColor: kColor10,
              floating: true,
              shadowColor: Colors.blue,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: CarouselSliderWidget(),
              ),
              // title: const CupertinoSearchTextField(
              //   backgroundColor: Colors.black,
              // ),
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
      ),
    );
  }
}

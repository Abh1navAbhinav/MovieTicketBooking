import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/home/widgets/carousel_slider.dart';
import 'package:ticket_booking/home/widgets/horizontal_items.dart';

class HomePagemovie extends GetView<HomeController> {
  const HomePagemovie({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return controller.carouselItemImage.shuffle();
      },
      child: Scaffold(
        backgroundColor: constantObj.kColor10,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 202,
              backgroundColor: constantObj.kColor10,
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

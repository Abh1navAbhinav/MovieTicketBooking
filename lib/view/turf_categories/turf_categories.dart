import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/view/turf_categories/widgets/category_lists.dart';

class TurfCategories extends GetView<HomeController> {
  const TurfCategories({
    super.key,
    required this.index1,
    required this.image,
  });
  final String image;
  final int index1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  CategoryLists(index1: index1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

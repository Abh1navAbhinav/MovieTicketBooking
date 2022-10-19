import 'package:flutter/material.dart';
import 'package:ticket_booking/view/category_list/widgets/items_list.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 4,
                (context, index) => ItemsList(indexs: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

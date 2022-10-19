import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}

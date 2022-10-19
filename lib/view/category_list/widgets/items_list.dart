import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
            ),
          ],
        ),
      ),
    );
  }
}

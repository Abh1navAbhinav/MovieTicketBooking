import 'package:flutter/material.dart';

class GridImages extends StatelessWidget {
  const GridImages({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      shadowColor: Colors.red,
      elevation: 5,
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

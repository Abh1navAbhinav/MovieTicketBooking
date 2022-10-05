import 'package:flutter/material.dart';
import 'package:ticket_booking/main.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kColor2,
        ),
        width: 40,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Image(
            image: AssetImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}

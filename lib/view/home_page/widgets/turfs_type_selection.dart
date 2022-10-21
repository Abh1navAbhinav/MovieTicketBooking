import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';

class TurfTypeSelection extends GetView<HomeController> {
  const TurfTypeSelection({
    Key? key,
    required this.index,
    required this.image,
  }) : super(key: key);
  final int index;

  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      // width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 50,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white.withOpacity(0.3),
            border: Border.all(color: Colors.white),
          ),
          height: 10,
          width: double.infinity,
          child: Center(
            child: Text(
              controller.carouselItemname[index],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, .5),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

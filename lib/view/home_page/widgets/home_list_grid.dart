import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/home_controller.dart';

class HomeListGrid extends GetView<HomeController> {
  const HomeListGrid({super.key, required this.heading, required this.indexs});
  final String heading;
  final int indexs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 1.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "  $heading",
            style: GoogleFonts.roboto(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            controller.carouselItemImage[indexs],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 7,
                      child: Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber.withOpacity(0.7),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.withOpacity(0.7),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.withOpacity(0.7),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.withOpacity(0.7),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.withOpacity(0.7),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      left: -10,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/bottom_navigation_controller.dart';

class BottomNavigationScreen extends GetView<BottomController> {
  BottomNavigationScreen({super.key});
  final bottomController = Get.put(BottomController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: controller.pages[controller.selectedPageIndex.value],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.7),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedIconTheme: const IconThemeData(
              size: 30,
            ),
            selectedItemColor: Colors.greenAccent,
            backgroundColor: Colors.transparent,
            currentIndex: controller.selectedPageIndex.value,
            onTap: (value) => controller.selectedPageIndex.value = value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

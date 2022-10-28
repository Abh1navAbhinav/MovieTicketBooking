import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/bottom_navigation_controller.dart';
import 'package:ticket_booking/controller/search_controller.dart';

class BottomNavigationScreen extends GetView<BottomController> {
  BottomNavigationScreen({super.key});
  final bottomController = Get.put(BottomController());
  final searchpagecontroller = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: controller.pages[controller.selectedPageIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white.withOpacity(0.5),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0,
            selectedIconTheme: const IconThemeData(
              size: 30,
            ),
            selectedItemColor: Colors.greenAccent,
            backgroundColor: Colors.transparent,
            currentIndex: controller.selectedPageIndex.value,
            onTap: (value) async {
              controller.selectedPageIndex.value = value;
              if (controller.selectedPageIndex.value == 0) {
                await Future.delayed(const Duration(milliseconds: 1500));
                searchpagecontroller.isSearchClicked.value = false;
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  (controller.selectedPageIndex.value == 0)
                      ? Icons.home
                      : Icons.home_outlined,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  (controller.selectedPageIndex.value == 1)
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined,
                ),
                label: 'wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  (controller.selectedPageIndex.value == 2)
                      ? Icons.person
                      : Icons.person_outline_outlined,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

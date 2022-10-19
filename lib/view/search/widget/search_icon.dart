import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/search_controller.dart';

class SearchIconwidget extends GetView<SearchPageController> {
  SearchIconwidget({super.key});
  final searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: 352,
        height: 60,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 5,
              bottom: 5,
              duration: const Duration(seconds: 1),
              left: controller.isSearchClicked.value ? 0 : 300,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: controller.isSearchClicked.value ? 0.4 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  height: 50,
                  width: controller.isSearchClicked.value ? 100 : 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: controller.isSearchClicked.value
                        ? Colors.amber
                        : Colors.amberAccent,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: 5,
              bottom: 5,
              duration: const Duration(seconds: 1),
              left: controller.isSearchClicked.value ? 0 : 300,
              child: IconButton(
                onPressed: () {
                  controller.isSearchClicked.value =
                      !controller.isSearchClicked.value;
                  controller.searchController.clear();
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ),
            AnimatedPositioned(
              top: 5,
              bottom: 5,
              duration: const Duration(seconds: 1),
              right: controller.isSearchClicked.value ? 0 : 300,
              width: controller.isSearchClicked.value ? 300 : 0,
              child: AnimatedOpacity(
                opacity: controller.isSearchClicked.value ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: controller.searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Enter the Search',
                    ),
                    onChanged: (value) async {
                      if (controller.searchController.text.isEmpty) {
                        await Future.delayed(
                          const Duration(seconds: 5),
                        );
                        controller.isSearchClicked.value = false;
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

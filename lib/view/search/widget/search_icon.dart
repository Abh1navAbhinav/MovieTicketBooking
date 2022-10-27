import 'package:blur_container/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/search_controller.dart';

class SearchIconwidget extends GetView<SearchPageController> {
  SearchIconwidget({super.key, required this.data});
  final List<dynamic> data;
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
                opacity: controller.isSearchClicked.value ? 0.3 : 1,
                child: BlurContainerWidget(
                  borderRadius: BorderRadius.circular(20),
                  color: controller.isSearchClicked.value
                      ? Colors.grey.withOpacity(0.6)
                      : Colors.grey.withOpacity(0.4),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    width: controller.isSearchClicked.value ? 100 : 50,
                  ),
                ),
              ),
              onEnd: () => controller.isIconChanged.value =
                  !controller.isIconChanged.value,
            ),
            AnimatedPositioned(
              top: 5,
              bottom: 5,
              duration: const Duration(seconds: 1),
              left: controller.isSearchClicked.value ? 0 : 300,
              child: IconButton(
                onPressed: () {
                  controller.searchForTurf(
                      controller.searchController.text.trim(), data);
                  controller.isSearchClicked.value =
                      !controller.isSearchClicked.value;
                  controller.searchController.clear();
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(
                  controller.isIconChanged.value
                      ? Icons.arrow_forward_ios_rounded
                      : Icons.search,
                  color: Colors.black54,
                  size: controller.isIconChanged.value ? 20 : null,
                ),
                /*  icon: AnimatedIcon(
                  icon: controller.isSearchClicked.value
                      ? AnimatedIcons.close_menu
                      : AnimatedIcons.search_ellipsis,
                  progress: controller.animatedIconController,
                ), */
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
                child: BlurContainerWidget(
                  color: Colors.grey[200]!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                      // color: Colors.amber,
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
                        controller.searchForTurf(
                          value.trim(),
                          data,
                        );
                      },
                    ),
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

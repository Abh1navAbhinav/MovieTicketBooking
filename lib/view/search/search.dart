import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/search_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/search/widget/search_all_turf.dart';
import 'package:ticket_booking/view/turf_description/turf_description.dart';

class SearchPage extends GetView<SearchPageController> {
  SearchPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<dynamic> data;

  final searchPageController = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: controller.isSearchClicked.value
            ? MediaQuery.of(context).size.height - 250
            : 0,
        color: !controller.isIconChanged.value
            ? Colors.black54
            : const Color.fromARGB(255, 239, 247, 239),
        child: controller.foundTurf.isNotEmpty
            ? ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, int index) {
                  final Datum datas = data[index];
                  return GestureDetector(
                      onTap: () => Get.to(() => TurfDescription(datum: datas),
                          transition: Transition.zoom,
                          curve: Curves.slowMiddle),
                      child: TurfSearchAllTurf(datas: datas));
                },
              )
            : const Center(
                child: Text('No result found'),
              ),
      ),
    );
  }
}

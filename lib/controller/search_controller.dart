import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPageController
    extends GetxController /*   with GetTickerProviderStateMixin */ {
  RxBool isIconChanged = false.obs;
  RxBool isSearchClicked = false.obs;
  final searchController = TextEditingController();

  List<dynamic> foundTurf = [];

  /*  late AnimationController animatedIconController = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 2,
    ),
  ); */

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

//--------------------------- searching for turf function --------------------------

  void searchForTurf(String query, List<dynamic> allTurf) {
    List<dynamic> searchResults = [];
    if (query.isEmpty) {
      searchResults = allTurf;
    } else {
      searchResults = allTurf
          .where(
            (element) => element.turfName!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
    }
    foundTurf = searchResults;
    update();
  }
}

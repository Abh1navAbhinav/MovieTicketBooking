import 'package:get/get.dart';

class WishListController extends GetxController {
  RxBool isFavSearched = false.obs;
  List<dynamic> foundTurf = [];

//--------------------------- searching for all  turf function --------------------------

  void searchForWishListTurf(String query, List<dynamic> allTurf) {
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

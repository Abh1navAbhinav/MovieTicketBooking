import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/model/home/all_turf/home_response.dart';
import 'package:ticket_booking/model/home/all_turf/turf_amenities.dart';
import 'package:ticket_booking/model/home/all_turf/turf_categories.dart';
import 'package:ticket_booking/model/home/all_turf/turf_image.dart';
import 'package:ticket_booking/model/home/all_turf/turf_info.dart';
import 'package:ticket_booking/model/home/all_turf/turf_price.dart';
import 'package:ticket_booking/model/home/all_turf/turf_time.dart';
import 'package:ticket_booking/model/home/all_turf/turf_type.dart';
import 'package:ticket_booking/services/fav_services.dart';

class WishListController extends GetxController {
  final HomeController homeController = Get.put(HomeController());
//-------------------------------------------------------------------------------------variables and lists

  RxBool isFavSearched = false.obs;
  List<dynamic> foundTurfFav = [];
  List<Datum> favaTurf = [];

//-------------------------------------------------------------------------------------searching for favourite turf function

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
    foundTurfFav = searchResults;
    update();
  }

//-------------------------------------------------------------------------------------add to wishList function

  Future<void> addFavToDb(Datum data) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final id = pref.getString('user_id');
    final AllResponse favResponse = AllResponse(
      userId: id,
      data: [
        Datum(
          id: data.id,
          turfName: data.turfName,
          turfPlace: data.turfPlace,
          turfMunicipality: data.turfMunicipality,
          turfDistrict: data.turfDistrict,
          turfLogo: data.turfLogo,
          v: data.v,
          turfCategory: TurfCategory(
              turfBadminton: data.turfCategory!.turfBadminton,
              turfYoga: data.turfCategory!.turfYoga,
              turfFootball: data.turfCategory!.turfFootball,
              turfCricket: data.turfCategory!.turfCricket),
          turfType: TurfType(
              turfFives: data.turfType!.turfFives,
              turfSevens: data.turfType!.turfSevens),
          turfAmenities: TurfAmenities(
            turfCafeteria: data.turfAmenities!.turfCafeteria,
            turfDressing: data.turfAmenities!.turfDressing,
            turfWashroom: data.turfAmenities!.turfWashroom,
            turfWater: data.turfAmenities!.turfWater,
            turfGallery: data.turfAmenities!.turfGallery,
            turfParking: data.turfAmenities!.turfParking,
          ),
          turfImages: TurfImages(
            turfImages1: data.turfImages!.turfImages1,
            turfImages2: data.turfImages!.turfImages2,
            turfImages3: data.turfImages!.turfImages3,
          ),
          turfInfo: TurfInfo(
              turfIsAvailable: data.turfInfo!.turfIsAvailable,
              turfMap: data.turfInfo!.turfMap,
              turfRating: data.turfInfo!.turfRating),
          turfPrice: TurfPrice(
            afternoonPrice: data.turfPrice!.afternoonPrice,
            eveningPrice: data.turfPrice!.eveningPrice,
            morningPrice: data.turfPrice!.morningPrice,
          ),
          turfTime: TurfTime(
              timeAfternoonEnd: data.turfTime!.timeAfternoonEnd,
              timeAfternoonStart: data.turfTime!.timeAfternoonStart,
              timeEveningEnd: data.turfTime!.timeEveningEnd,
              timeEveningStart: data.turfTime!.timeEveningStart,
              timeMorningEnd: data.turfTime!.timeMorningEnd,
              timeMorningStart: data.turfTime!.timeMorningStart),
        ),
      ],
    );

    await FavServices().addToWishList(favResponse);
  }

//------------------------------------------------------------------------------------- remove from wishlist function

  Future<void> removeFromFav(String turfId) async {
    await FavServices().deleteWishlist(turfId);
  }

//-------------------------------------------------------------------------------------Get favourite list

  Future<void> getFav() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final id = pref.getString('user_id');

    final favresponse = await FavServices().getFav(id!);
    favaTurf.clear();
    if (favresponse != null) {
      favaTurf.addAll(favresponse.data!);
      log("fav turf list:------- $favaTurf");
    } else {
      log('favresponse is null');
    }
  }

//-------------------------------------------------------------------------------------checking whether the turf is already added to favourite or not

  RxBool isFav(Datum data) {
    return favaTurf.contains(data).obs;
  }

//-------------------------------------------------------------------------------------favourite button final function

  checkFavAndAddToDb(Datum data) async {
    isFav(data).value == true
        ? await removeFromFav(data.id!)
        : await addFavToDb(data);
    log("isfav.value ${isFav(data).value}");
    await getFav();
    // log('inside checkandaddtodb after calling getfav favturflist length is :${favaTurf.length}');
  }
//-------------------------------------------------------------------------------------oninit

  @override
  void onInit() {
    foundTurfFav = homeController.allTurf;
    super.onInit();
  }
}

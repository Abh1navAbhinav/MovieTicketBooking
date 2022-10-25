import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/controller/location_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/services/home_services.dart';

class HomeController extends GetxController {
  final locationController = Get.put(LocationController());
  //--------------------------Lists & variables---------------------------------

  List<String> carouselItemImage = [
    'assets/images/cricketTurf1.jpg',
    'assets/images/footballTurf1.jpg',
    'assets/images/badmintonTurf1.jpg',
    'assets/images/yogaTurf1.jpg',
  ];
  List<String> carouselItemname = [
    'Cricket',
    'FootBall',
    'BadMinton',
    'Yoga',
  ];
  var nearByTurf = [].obs;
  var allTurf = [].obs;
  var badmintonTurf = [].obs;
  var footballTurf = [].obs;
  var cricketTurf = [].obs;
  var yogaTurf = [].obs;
  var compainedSeparatedList = [].obs;

//------------------------------------adding to  near by turflist -------------------------------------

  Future<void> addToNearByTurfList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final location = locationController.currentAddressToTurfFetch.value;
    final response = await HomeServices().fetchNearbyTurf(
      location: location,
      token: token!,
    );
    nearByTurf.clear();
    if (response != null && response.status == true) {
      nearByTurf.addAll(response.data!);
    }
  }

//------------------------------------adding to all turflist -------------------------------------

  Future<void> addToAllTurfList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final response = await HomeServices().fetchAllTurf(token: token!);
    allTurf.clear();
    if (response != null && response.status == true) {
      allTurf.addAll(response.data!);
    } else {}
  }

//--------------------------------------separating categories to seperate list  in all turf ---------------------------------------

  Future<void> separateCategoriesInAllTurf() async {
    badmintonTurf.clear();
    cricketTurf.clear();
    footballTurf.clear();
    yogaTurf.clear();

    for (Datum element in allTurf) {
      if (element.turfCategory!.turfBadminton == true) {
        badmintonTurf.add(element);
      }
      if (element.turfCategory!.turfCricket == true) {
        cricketTurf.add(element);
      }
      if (element.turfCategory!.turfFootball == true) {
        footballTurf.add(element);
      }
      if (element.turfCategory!.turfYoga == true) {
        yogaTurf.add(element);
      }
    }
  }

//--------------------------------------adding the seperated list to a single list----------------------------------------

  void addAllSeparatedLIst() {
    RxList<dynamic> addSeparatedListToOnelist(i) {
      switch (i) {
        case 1:
          return cricketTurf;
        case 2:
          return footballTurf;
        case 3:
          return badmintonTurf;
        default:
          return yogaTurf;
      }
    }

    for (var i = 1; i <= 4; i++) {
      compainedSeparatedList.add(addSeparatedListToOnelist(i));
    }
  }

//--------------------------------------all functions need to call in home initstate to fetch data---------------------------------

  homeRefreshIndicatorFunction() async {
    await locationController.getCurrentPosition();
    addToNearByTurfList();
    await addToAllTurfList();
    await separateCategoriesInAllTurf();
    addAllSeparatedLIst();
  }

//----------------------------------------oninit function---------------------------------------------------------------

  @override
  void onInit() async {
    await homeRefreshIndicatorFunction();
    super.onInit();
  }
}

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/controller/location_controller.dart';
import 'package:ticket_booking/services/home_services.dart';

class HomeController extends GetxController {
  final locationController = Get.put(LocationController());
  //--------------------------Lists---------------------------------

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

  addToNearByTurfList() async {
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

  homeRefreshIndicatorFunction() async {
    await locationController.getCurrentPosition();
    await addToNearByTurfList();
  }
}

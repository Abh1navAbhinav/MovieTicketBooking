import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/controller/location_controller.dart';
import 'package:ticket_booking/view/bottom_navigation/bottom_screen.dart';

class SplashScreenController extends GetxController {
  final homeController = Get.put(HomeController());
  final locationcontroller = Get.put(LocationController());
  @override
  void onInit() async {
    await homeController.homeRefreshIndicatorFunction();
    checkUserLoggedIn();

    super.onInit();
  }

  checkUserLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userLoggedIn = pref.getBool('userLoggedIn');
    if (userLoggedIn == true || userLoggedIn != null) {
      Get.offAll(
        () => BottomNavigationScreen(),
        transition: Transition.native,
        duration: const Duration(
          seconds: 3,
        ),
      );
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(
        () => BottomNavigationScreen(),
        transition: Transition.native,
        duration: const Duration(
          seconds: 3,
        ),
      );
    }
  }
}

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/view/bottom_navigation/bottom_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }

  checkUserLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userLoggedIn = pref.getBool('userLoggedIn');
    if (userLoggedIn == true || userLoggedIn != null) {
      await Future.delayed(const Duration(seconds: 2));
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

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/view/home_page/home.dart';
import 'package:ticket_booking/view/login/login.dart';

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
      Get.to(
        () => HomePage(),
        transition: Transition.native,
        duration: const Duration(
          seconds: 3,
        ),
      );
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.to(
        () => LoginPage(),
        transition: Transition.native,
        duration: const Duration(
          seconds: 3,
        ),
      );
    }
  }
}

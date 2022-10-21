import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/controller/location_controller.dart';
import 'package:ticket_booking/view/bottom_navigation/bottom_screen.dart';
import 'package:ticket_booking/view/login/login.dart';

class SplashScreenController extends GetxController {
  final locationcontroller = Get.put(LocationController());
  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }

  checkUserLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userLoggedIn = pref.getString('token');
    log(userLoggedIn.toString());
    if (userLoggedIn == null || userLoggedIn.isEmpty) {
      Get.offAll(
        () => LoginPage(),
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

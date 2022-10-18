import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/view/login/login.dart';

class ProfilePageController extends GetxController {
  //-------------------------Logout function-----------------------------

  logoutFunction() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('userLoggedIn');
    Get.offAll(() => LoginPage());
  }
}

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/view/login/login.dart';

class HomeController extends GetxController {
  List<String> carouselItemImage = [
    'assets/images/theater1.jpg',
    'assets/images/theater2.jpg',
    'assets/images/theater3.jpg',
    'assets/images/theater1.jpg',
    'assets/images/theater2.jpg',
    'assets/images/theater3.jpg',
  ];

  //-------------------------Logout function-----------------------------

  logoutFunction() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('userLoggedIn');
    Get.offAll(() => LoginPage());
  }
}

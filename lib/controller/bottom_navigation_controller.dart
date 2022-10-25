import 'package:get/get.dart';
import 'package:ticket_booking/view/home_page/home.dart';
import 'package:ticket_booking/view/profile/profile.dart';
import 'package:ticket_booking/view/wishlist/wishlist.dart';

class BottomController extends GetxController {
  // final homecontrller = Get.put(HomeController());
  final pages = [
    HomePage(),
    const Wishlist(),
    ProfilePage(),
  ];

  RxInt selectedPageIndex = 0.obs;
  // @override
  // void onInit() async {
  //   await homecontrller.homeRefreshIndicatorFunction();
  //   super.onInit();
  // }
}

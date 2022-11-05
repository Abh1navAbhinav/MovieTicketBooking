import 'package:get/get.dart';
import 'package:ticket_booking/view/home_page/home.dart';
import 'package:ticket_booking/view/profile/profile.dart';
import 'package:ticket_booking/view/wishlist/wishlist.dart';

class BottomController extends GetxController {
  // final homecontrller = Get.put(HomeController());
  final pages = [
    HomePage(),
    Wishlist(),
    ProfilePage(),
  ];

  RxInt selectedPageIndex = 0.obs;
  // @override
  // void onInit() async {
  //   await homecontrller.homeRefreshIndicatorFunction();
  //   super.onInit();
  // }
}
/*  void selectingSlot({
    required int index,
    required List<String> list,
    required int price,
    required String key,
  }) {
//---------variables

    var temp = list[index].trim();
    var splittedtime = temp.split(':').first;
    var parsedTime = int.parse(splittedtime);
    var finalTime = 0;
    var parseddate = parseDate(selectedDate);
//-----checking if morning and adding 12 if not morning

    if (key != 'Morning') {
      finalTime = parsedTime + 12;
    } else {
      finalTime = parsedTime;
    }
//------final checking if the slot contains the list or not
    if (parseddate == DateTime.now().day.toString()) {
      if (selectedSlots.contains(list[index])) {
        if (finalTime > DateTime.now().hour) {
          totalAmount -= price;
          selectedSlots.remove(list[index]);
        } else {
          constantObj.getSnackbarMethod(
            message: 'Time not available',
            duration: 1,
          );
        }
      } else {
        if (finalTime > DateTime.now().hour) {
          totalAmount += price;
          selectedSlots.add(list[index]);
        } else {
          constantObj.getSnackbarMethod(
            message: 'Time not available',
            duration: 1,
          );
        }
      }
    } else {
      if (selectedSlots.contains(list[index])) {
        totalAmount -= price;
        selectedSlots.remove(list[index]);
      } else {
        totalAmount += price;
        selectedSlots.add(list[index]);
      }
    }

    // log('final time $finalTime');
    // log("date time now ${DateTime.now().hour}");
    // log('selected date $selectedDate');
    // log('date time date ${DateTime.now().day}');
    // log(selectedSlots.toString());
    // log(totalAmount.toString());
    // log(parseDate(selectedDate));
    update();
  } */
import 'package:get/get.dart';

class BookingController extends GetxController {
  DateTime selectedDate = DateTime.now();
  RxBool isFinished = false.obs;
}

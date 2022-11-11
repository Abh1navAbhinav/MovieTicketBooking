import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/booking/booking_request.dart';
import 'package:ticket_booking/model/booking/booking_response.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/services/turf_booking_service.dart';
import 'package:ticket_booking/view/home_page/home.dart';

class BookingController extends GetxController {
//----------------------------------------------------------------variables
  String selectedDate = '11/9/2022';
  String turfId = '';
  RxBool isFinished = false.obs;
  bool isAvailableTime = false;
  RxBool isLoading = false.obs;
  int totalAmount = 0;
  int finalTime = 0;
  List<String> selectedSlots = [];
  List<int> convertedTimeList = [];
  List<String> convertedmngTimeList = [];
  List<String> convertedaftTimeList = [];
  List<String> convertedevngTimeList = [];
  List<int> convertedTimeList24Hrs = [];
  List<int> bookedSlots = [];
  Map<String, List<int>> alreadyBookedSlots = {};

//-------------------------------------------------------------------------RazorPay
  late Razorpay _razorpay;

//----------------------------------------------------------------converting 24 hrs to 12 hrs
  void convert24Hrs(Datum data) {
    List<int> mngtoevngList = [];
    convertedTimeList.clear();
    mngtoevngList.addAll([
      data.turfTime!.timeMorningStart!,
      data.turfTime!.timeMorningEnd!,
      data.turfTime!.timeAfternoonStart!,
      data.turfTime!.timeAfternoonEnd!,
      data.turfTime!.timeEveningStart!,
      data.turfTime!.timeEveningEnd!,
    ]);
    for (var i = 0; i < mngtoevngList.length; i++) {
      if (mngtoevngList[i] >= 13) {
        convertedTimeList.add(mngtoevngList[i] - 12);
      } else {
        convertedTimeList.add(mngtoevngList[i]);
      }
    }
  }

//-----------------------------------------------------------------------adding converted list to separate list
  void addingConvertedTimeToList({
    required List list,
    required int first,
    required int second,
    required String time,
  }) {
    list.clear();
    for (var i = first; i < second; i++) {
      list.add("$time$i:00 - ${i + 1}:00$time");
    }
  }

//------------------------------------------------------------------------ontap of book button in description page

  Future<void> descriptionBookingOnpressed(Datum data) async {
    isLoading.value = true;
    turfId = data.id!;
    convert24Hrs(data);
    selectedSlots.clear();
    totalAmount = 0;
    addingConvertedTimeToList(
      first: convertedTimeList[0],
      second: convertedTimeList[1],
      list: convertedmngTimeList,
      time: '',
    );
    addingConvertedTimeToList(
      first: convertedTimeList[2],
      second: convertedTimeList[3],
      list: convertedaftTimeList,
      time: '   ',
    );
    addingConvertedTimeToList(
      first: convertedTimeList[4],
      second: convertedTimeList[5],
      list: convertedevngTimeList,
      time: '     ',
    );
    selectedDate = parseDate(DateTime.now());
    await getBookedTurfList(id: data.id!);
    addingAlreadyBookedToList();

    isLoading.value = false;
  }

//---------------------------------checking is available or not

  bool isAvailableCheckFunction({
    required String item,
    required String heading,
  }) {
    finalTime = 0;

    var nowDate = parseDate(DateTime.now());

    if (heading != 'Morning') {
      finalTime = int.parse(item.trim().split(':').first) + 12;
    } else {
      finalTime = int.parse(item.trim().split(':').first);
    }
    return (DateTime.now().hour >= finalTime && selectedDate == nowDate) ||
        bookedSlots.contains(finalTime);
  }

//--------------------------------------------------------------------------selecting slots

  void selectingSlot({
    required int index,
    required List<String> list,
    required int price,
    required String key,
  }) {
    var nowDate = parseDate(DateTime.now());
//-----checking if morning and adding 12 if not morning

    if (key != 'Morning') {
      finalTime = int.parse(list[index].trim().split(':').first) + 12;
    } else {
      finalTime = int.parse(list[index].trim().split(':').first);
    }
//------final checking if the slot contains the list or not

    if (selectedDate == nowDate) {
      if (finalTime > DateTime.now().hour) {
        checkAndAddPrice(list, index, price, finalTime);
      }
    } else {
      checkAndAddPrice(list, index, price, finalTime);
    }
    update();
  }

//-------------------------------------------------------------------------------------------Check and add price to total amount
  void checkAndAddPrice(
    List<String> list,
    int index,
    int price,
    int finalTime,
  ) {
    if (selectedSlots.contains(list[index]) ||
        bookedSlots.contains(finalTime)) {
      totalAmount -= price;
      convertedTimeList24Hrs.remove(finalTime);
      selectedSlots.remove(list[index]);
    } else {
      totalAmount += price;
      convertedTimeList24Hrs.add(finalTime);
      selectedSlots.add(list[index]);
    }
  }

//--------------------------------------------parsing dat

  String parseDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

//--------------------------------------------on date change function

  void onDateChangeFunction(selectedDates) {
    selectedDate = parseDate(selectedDates);
    totalAmount = 0;
    selectedSlots.clear();
    convertedTimeList24Hrs.clear();
    addingAlreadyBookedToList();
    update();
  }

//-----------------------------------------------get booked turf list

  Future<void> getBookedTurfList({required String id}) async {
    final BookResponse? response =
        await BookingService().getBookedTurfList(id: id);

    for (var element in response!.data) {
      alreadyBookedSlots[element.bookingDate] = element.timeSlot;
    }
  }

//-------------------------------------------------------------adding already booked slots to a list
  void addingAlreadyBookedToList() {
    bookedSlots.clear();
    if (alreadyBookedSlots.containsKey(selectedDate)) {
      bookedSlots.addAll(alreadyBookedSlots[selectedDate]!);
    }
  }

//----------------------------------------------------------------book turf function
  Future<void> bookTurf() async {
    final AddBookedSlots model = AddBookedSlots(
      bookingDate: selectedDate,
      turfId: turfId,
      timeSlot: convertedTimeList24Hrs,
    );
    final AddBookedSlots? statusAfterBooked =
        await BookingService().addToBookedTurf(model: model);
    await constantObj.getSnackbarMethod(
      message: statusAfterBooked!.message!.toString(),
      duration: 1,
      success: true,
    );
  }

//-------------------------------------------------------------------------------------oninit
  @override
  void onInit() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

//-----------------------------------------------------------------------------------on dispose

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

//---------------------------------------------------------------------------options

//-------------------------------------------------------------------------open the razorpay

  void openRazorpay() {
    var options = {
      'key': 'rzp_test_5497QNEKbfsHqj',
      'amount': totalAmount * 100, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
    };

    _razorpay.open(options);
    Get.back();
  }
//--------------------------------------------------------------------------------razorpay functions

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Get.offAll(() => HomePage());
    await bookTurf();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Get.back();
    constantObj.getSnackbarMethod(message: response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    constantObj.getSnackbarMethod(message: response.walletName.toString());
  }
}

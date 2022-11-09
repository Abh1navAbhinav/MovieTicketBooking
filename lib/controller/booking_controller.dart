import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/booking/booking_response.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/services/turf_booking_service.dart';

class BookingController extends GetxController {
//----------------------------------------------------------------variables
  DateTime selectedDate = DateTime.now();
  RxBool isFinished = false.obs;
  bool isAvailableTime = false;
  int totalAmount = 0;
  List<String> backendBookedDate = [];
  List<dynamic> backendbookedtimeslots = [];
  List<String> selectedSlots = [];
  List<int> convertedTimeList = [];
  List<String> convertedmngTimeList = [];
  List<String> convertedaftTimeList = [];
  List<String> convertedevngTimeList = [];
  List<int> convertedSelectedSlots24Hrs = [];

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
    convertedSelectedSlots24Hrs.clear();
    backendBookedDate.clear();
    backendbookedtimeslots.clear();
    await getBookedTurfList(id: data.id!);
  }

//---------------------------------checking is available or not

  bool isAvailableCheckFunction({
    required String item,
    required String heading,
  }) {
    var finalTime = 0;
    var parseddate = parseDate(selectedDate);
    if (heading != 'Morning') {
      finalTime = int.parse(item.trim().split(':').first) + 12;
    } else {
      finalTime = int.parse(item.trim().split(':').first);
    }
    return DateTime.now().hour >= finalTime &&
        parseddate == DateTime.now().day.toString();
  }

//--------------------------------------------------------------------------selecting slots

  void selectingSlot({
    required int index,
    required List<String> list,
    required int price,
    required String key,
  }) {
    var finalTime = 0;
    var parseddate = parseDate(selectedDate);
    var nowDate = DateTime.now().day.toString();
//-----checking if morning and adding 12 if not morning

    if (key != 'Morning') {
      finalTime = int.parse(list[index].trim().split(':').first) + 12;
    } else {
      finalTime = int.parse(list[index].trim().split(':').first);
    }
//------final checking if the slot contains the list or not
    if (parseddate == nowDate) {
      if (finalTime > DateTime.now().hour) {
        checkAndAddPrice(list, index, price, finalTime);
      } else {
        constantObj.getSnackbarMethod(
          message: 'Time not available',
          duration: 1,
        );
      }
    } else {
      checkAndAddPrice(list, index, price, finalTime);
    }

    log("converted24hrs $convertedSelectedSlots24Hrs");
    log('back_end_booked_times_slot : $backendbookedtimeslots');
    log('back end date : $backendBookedDate');
    log('selected date : $parseddate');
    update();
  }

//-------------------------------------------------------------------------------------------Check and add price to total amount
  void checkAndAddPrice(
    List<String> list,
    int index,
    int price,
    int finalTime,
  ) {
    if (selectedSlots.contains(list[index])) {
      totalAmount -= price;
      convertedSelectedSlots24Hrs.remove(finalTime);
      selectedSlots.remove(list[index]);
    } else {
      totalAmount += price;
      convertedSelectedSlots24Hrs.add(finalTime);
      selectedSlots.add(list[index]);
    }
  }

//--------------------------------------------parsing dat

  String parseDate(DateTime date) {
    return DateFormat.d().format(date);
  }

//--------------------------------------------on date change function

  void onDateChangeFunction(selectedDates) {
    selectedDate = selectedDates;
    totalAmount = 0;
    convertedSelectedSlots24Hrs.clear();
    selectedSlots.clear();

    update();
  }

//-----------------------------------------------get booked turf list

  Future<void> getBookedTurfList({required String id}) async {
    log(id);
    backendbookedtimeslots.clear();
    log(backendbookedtimeslots.toString());
    final BookResponse? response =
        await BookingService().getBookedTurfList(id: id);

    for (var i = 0; i < response!.data.length; i++) {
      backendbookedtimeslots.addAll(
        response.data[i].timeSlot,
      );
      backendBookedDate.add(response.data[i].bookingDate);
    }
  }
}

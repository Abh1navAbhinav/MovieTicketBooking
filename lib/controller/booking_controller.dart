import 'dart:developer';

import 'package:get/get.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class BookingController extends GetxController {
//----------------------------------------------------------------variables
  DateTime selectedDate = DateTime.now();
  RxBool isFinished = false.obs;
  List<String> selectedSlots = [];
  List<int> convertedTimeList = [];
  List<String> convertedmngTimeList = [];
  List<String> convertedaftTimeList = [];
  List<String> convertedevngTimeList = [];

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

    log(list.toString());
  }

//------------------------------------------------------------------------ontap of book button in description page

  void descriptionBookingOnpressed(Datum data) {
    convert24Hrs(data);
    selectedSlots.clear();
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
  }

//--------------------------------------------------------------------------selecting slots

  void selectingSlot(int index, list) {
    if (selectedSlots.contains(list[index])) {
      selectedSlots.remove(list[index]);
    } else {
      selectedSlots.add(list[index]);
    }
    update();
  }
}

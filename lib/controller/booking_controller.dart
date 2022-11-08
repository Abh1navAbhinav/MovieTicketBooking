import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class BookingController extends GetxController {
//----------------------------------------------------------------variables
  DateTime selectedDate = DateTime.now();
  RxBool isFinished = false.obs;
  bool isAvailableTime = false;
  int totalAmount = 0;
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
  }

//------------------------------------------------------------------------ontap of book button in description page

  void descriptionBookingOnpressed(Datum data) {
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
  }

//---------------------------------checking is available or not

  bool isAvailableCheckFunction({
    required String item,
    required String heading,
  }) {
    var temp = item.trim();
    var splittedtime = temp.split(':').first;
    var parsedTime = int.parse(splittedtime);
    var parseddate = parseDate(selectedDate);
    var finalTime = 0;
    if (heading != 'Morning') {
      finalTime = parsedTime + 12;
    } else {
      finalTime = parsedTime;
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

    update();
  }

//--------------------------------------------parsing dat

  String parseDate(DateTime date) {
    return DateFormat.d().format(date);
  }

//--------------------------------------------on date change function

  void onDateChangeFunction(selectedDates) {
    selectedDate = selectedDates;
    totalAmount = 0;
    selectedSlots.clear();
    update();
  }
}

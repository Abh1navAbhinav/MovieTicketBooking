import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/booking_controller.dart';
import 'package:ticket_booking/global_constants/scroll_behaviour.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/turf_booking/widgets/swipeable_button.dart';
import 'package:ticket_booking/view/turf_booking/widgets/time_slots_with_heading.dart';
import 'package:ticket_booking/view/turf_description/widgets/headings_turf.dart';

class TurfBookingPage extends GetView<BookingController> {
  TurfBookingPage({super.key, required this.data});
  final Datum data;
  final bookincontroller = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.date_range),
                      splashRadius: 20,
                      splashColor: Colors.green,
                      onPressed: () async {
                        final calenderPickedDate = await showDatePicker(
                          context: context,
                          initialDate: controller.selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 31),
                          ),
                        );
                        controller.selectedDate = calenderPickedDate!;
                      },
                    ),
                  ],
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: controller.selectedDate,
                  daysCount: 31,
                  selectionColor: Colors.green,
                  selectedTextColor: Colors.white,
                  onDateChange: (selectedDate) {
                    controller.selectedDate = selectedDate;
                  },
                ),
                const HeadingsDescriptions(heading: 'Select your time slot'),
                TimeSlotsBookingwithHeading(
                  data: data,
                  heading: 'Morning',
                  headingIcon: Icons.wb_sunny_rounded,
                  iconColor: Colors.amber[300]!,
                  list: controller.convertedmngTimeList,
                ),
                TimeSlotsBookingwithHeading(
                  data: data,
                  heading: 'Afternoon',
                  headingIcon: Icons.sunny,
                  list: controller.convertedaftTimeList,
                  iconColor: const Color.fromARGB(255, 255, 143, 7),
                ),
                TimeSlotsBookingwithHeading(
                  data: data,
                  heading: 'Evening',
                  headingIcon: Icons.nights_stay_outlined,
                  iconColor: Colors.black,
                  list: controller.convertedevngTimeList,
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: const SwipeAbleButtonWidget(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SwipeAbleButtonWidget(data: data),
      ),
    );
  }
}

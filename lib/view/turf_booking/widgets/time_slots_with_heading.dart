import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/booking_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class TimeSlotsBookingwithHeading extends GetView<BookingController> {
  const TimeSlotsBookingwithHeading({
    Key? key,
    required this.data,
    required this.heading,
    required this.headingIcon,
    required this.iconColor,
    required this.list,
  }) : super(key: key);

  final Datum data;
  final String heading;
  final IconData headingIcon;
  final Color iconColor;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.green.withOpacity(0.02),
          leading: Icon(
            headingIcon,
            color: iconColor,
          ),
          title: Text(
            heading,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            heading == 'Morning'
                ? '₹${data.turfPrice!.morningPrice!}'
                : (heading == 'Afternoon'
                    ? '₹${data.turfPrice!.afternoonPrice!}'
                    : '₹${data.turfPrice!.eveningPrice!}'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Wrap(
          children: List.generate(
            list.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  controller.selectingSlot(index, list);
                },
                child: GetBuilder<BookingController>(
                  builder: (controllers) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green.withOpacity(0.5)),
                      color: controller.selectedSlots.contains(list[index])
                          ? constantObj.kSelectedSlotsColor
                          : constantObj.kUnSelectedSlotsColor,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            list[index].trim(),
                            style: TextStyle(
                              color:
                                  controller.selectedSlots.contains(list[index])
                                      ? constantObj.kSelectedSlotTextColor
                                      : constantObj.kUnselectedSlotTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

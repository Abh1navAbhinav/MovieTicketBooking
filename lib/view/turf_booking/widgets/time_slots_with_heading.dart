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
    required this.price,
  }) : super(key: key);

  final Datum data;
  final String heading;
  final IconData headingIcon;
  final Color iconColor;
  final List<String> list;
  final int price;
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
                  controller.selectingSlot(
                    index: index,
                    list: list,
                    price: price,
                    key: heading,
                  );
                },
                child: GetBuilder<BookingController>(
                  builder: (controllers) {
                    controller.isAvailableTime.value =
                        controller.isAvailableCheckFunction(
                      item: list[index],
                      heading: heading,
                    );
                    return Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.cyan.withOpacity(0.4),
                      elevation: controller.selectedSlots.contains(list[index])
                          ? 0
                          : controller.isAvailableTime.value
                              ? 0
                              : 5,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: !controller.isAvailableTime.value
                                ? Colors.green.withOpacity(0.5)
                                : Colors.white38,
                          ),
                          color: controller.selectedSlots.contains(list[index])
                              ? constantObj.kSelectedSlotsColor
                              : controller.isAvailableTime.value
                                  ? constantObj.kAlreadyBookedSlots
                                  : constantObj.kUnSelectedSlotsColor,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Center(
                          child: FittedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                list[index].trim(),
                                style: TextStyle(
                                  color: controller.selectedSlots
                                          .contains(list[index])
                                      ? constantObj.kSelectedSlotTextColor
                                      : controller.isAvailableTime.value
                                          ? Colors.white38
                                          : constantObj
                                              .kUnselectedSlotTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

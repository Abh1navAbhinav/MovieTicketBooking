import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/booking_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/turf_description/widgets/turf_name_and_location.dart';

class CustomGetModalSheet extends GetView<BookingController> {
  const CustomGetModalSheet({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TurfNameAndLocation(datum: data),
          const SizedBox(height: 20),
          Container(
            color: Colors.green.withOpacity(0.06),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '   Booked for',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '12/6/2022    ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Booked time\'s',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const Divider(),
          Wrap(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                    color: Colors.green.withOpacity(0.4),
                  ),
                  height: 30,
                  width: 100,
                  child: const Center(
                    child: Text(
                      '1:30 pm',
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.greenAccent.withOpacity(0.4),
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Total amount',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.green,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'book now',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

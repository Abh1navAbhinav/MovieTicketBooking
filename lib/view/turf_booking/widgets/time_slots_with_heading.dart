import 'package:flutter/material.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class TimeSlotsBookingwithHeading extends StatelessWidget {
  const TimeSlotsBookingwithHeading({
    Key? key,
    required this.data,
    required this.heading,
    required this.headingIcon,
    required this.iconColor,
  }) : super(key: key);

  final Datum data;
  final String heading;
  final IconData headingIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
      ],
    );
  }
}

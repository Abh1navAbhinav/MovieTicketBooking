import 'package:flutter/material.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class TimeSlotsBookingwithHeading extends StatelessWidget {
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
  final List list;

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
            list.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                  color: Colors.green.withOpacity(0.4),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.28,
                child: Center(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        list[index],
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

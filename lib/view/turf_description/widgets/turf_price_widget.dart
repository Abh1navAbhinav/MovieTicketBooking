import 'package:flutter/material.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class TurfPriceWidget extends StatelessWidget {
  const TurfPriceWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.datum,
    required this.iconColor,
  }) : super(key: key);

  final Datum datum;
  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
          size: text == 'Evening' ? 20 : null,
        ),
        title: Text(text),
        trailing: text == 'Morning'
            ? Text('₹${datum.turfPrice!.morningPrice!}')
            : (text == 'Afternoon'
                ? Text('₹${datum.turfPrice!.afternoonPrice!}')
                : Text('₹${datum.turfPrice!.eveningPrice!}')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class TurfNameAndLocation extends StatelessWidget {
  const TurfNameAndLocation({
    Key? key,
    required this.datum,
  }) : super(key: key);

  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.location_on),
            Text(
              "${datum.turfMunicipality!}, ${datum.turfDistrict!}",
              style: GoogleFonts.adamina(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              datum.turfName!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

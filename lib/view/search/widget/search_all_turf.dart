import 'package:flutter/material.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/wishlist/widgets/fav_turf_icon_button.dart';

class TurfSearchAllTurf extends StatelessWidget {
  const TurfSearchAllTurf({
    Key? key,
    required this.datas,
  }) : super(key: key);

  final Datum datas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
              datas.turfLogo!,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FavTurfIconButton(data: datas),
                  Text(
                    "   ${datas.turfName!}",
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(
                        datas.turfPlace!,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        datas.turfInfo!.turfRating!.toString(),
                      ),
                    ],
                  ),
                  datas.turfInfo!.turfIsAvailable!
                      ? const Text(
                          'Available',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )
                      : const Text(
                          'Not available',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/turf_description/widgets/carousel_slider.dart';

class TurfDescription extends StatelessWidget {
  const TurfDescription({super.key, required this.datum});
  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: CarouselSliderWidgetInDescription(image: [
                  datum.turfImages!.turfImages1!,
                  datum.turfImages!.turfImages2!,
                  datum.turfImages!.turfImages3!
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(datum.turfName!),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(
                            "${datum.turfMunicipality!}   ${datum.turfDistrict!}",
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Turf Amenities',
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      _Ammenries(
                          text: 'Cafeteria',
                          value: datum.turfAmenities!.turfCafeteria!),
                      _Ammenries(
                          text: 'Dressing',
                          value: datum.turfAmenities!.turfDressing!),
                      _Ammenries(
                          text: 'Gallery',
                          value: datum.turfAmenities!.turfGallery!),
                      _Ammenries(
                          text: 'Parking',
                          value: datum.turfAmenities!.turfParking!),
                      _Ammenries(
                          text: 'Wash Room',
                          value: datum.turfAmenities!.turfWashroom!),
                      _Ammenries(
                          text: 'Water',
                          value: datum.turfAmenities!.turfWater!),
                    ],
                  ),
                  RatingBarIndicator(
                    rating: datum.turfInfo!.turfRating!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 40.0,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Turf price',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Morning Price: '),
                      Text('${datum.turfPrice!.morningPrice!}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('afternoon price: '),
                      Text('${datum.turfPrice!.afternoonPrice!}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Evening price: '),
                      Text('${datum.turfPrice!.eveningPrice!}'),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Isavailable: '),
                      Text(
                        datum.turfInfo!.turfIsAvailable!
                            ? 'Available'
                            : 'Currently not Available',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('rating: '),
                      Text("${datum.turfInfo!.turfRating}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('TURF TYPE: '),
                      Text(
                        datum.turfType!.turfSevens! ? '7\'s' : '6\'s',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        MediaQuery.of(context).size.width - 50,
                        50,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Book"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Ammenries extends StatelessWidget {
  const _Ammenries({required this.value, required this.text});
  final bool value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return value
        ? Row(
            children: [
              const Icon(Icons.circle_outlined),
              Text(
                text,
              ),
            ],
          )
        : const SizedBox();
  }
}

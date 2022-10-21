import 'package:flutter/material.dart';
import 'package:ticket_booking/model/home/nearyou/datum.dart';
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
                  GridView.count(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20),
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    children: List.generate(6, (index) {
                      return Row(
                        children: const [
                          Icon(Icons.circle_outlined),
                          Text(
                            'Amenities',
                          ),
                        ],
                      );
                    }),
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

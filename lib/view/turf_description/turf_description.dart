import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/booking_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/global_constants/scroll_behaviour.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/turf_booking/turf_booking.dart';
import 'package:ticket_booking/view/turf_description/widgets/amenities_list.dart';
import 'package:ticket_booking/view/turf_description/widgets/carousel_slider.dart';
import 'package:ticket_booking/view/turf_description/widgets/headings_turf.dart';
import 'package:ticket_booking/view/turf_description/widgets/turf_name_and_location.dart';
import 'package:ticket_booking/view/turf_description/widgets/turf_price_widget.dart';

class TurfDescription extends GetView<BookingController> {
  TurfDescription({super.key, required this.datum});
  final bookingcontroller = Get.put(BookingController());
  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TurfNameAndLocation(datum: datum),
                      CarouselSliderWidgetInDescription(
                        image: [
                          datum.turfImages!.turfImages1!,
                          datum.turfImages!.turfImages2!,
                          datum.turfImages!.turfImages3!
                        ],
                      ),
                      const SizedBox(height: 10),
                      RatingBarIndicator(
                        rating: datum.turfInfo!.turfRating!,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const HeadingsDescriptions(
                      heading: 'Available Turf Amenities',
                    ),
                    Wrap(
                      children: [
                        AmmenitiesList(
                          text: 'Cafeteria',
                          value: datum.turfAmenities!.turfCafeteria!,
                        ),
                        AmmenitiesList(
                          text: 'Dressing',
                          value: datum.turfAmenities!.turfDressing!,
                        ),
                        AmmenitiesList(
                          text: 'Gallery',
                          value: datum.turfAmenities!.turfGallery!,
                        ),
                        AmmenitiesList(
                          text: 'Parking',
                          value: datum.turfAmenities!.turfParking!,
                        ),
                        AmmenitiesList(
                          text: 'Wash Room',
                          value: datum.turfAmenities!.turfWashroom!,
                        ),
                        AmmenitiesList(
                          text: 'Water',
                          value: datum.turfAmenities!.turfWater!,
                        ),
                      ],
                    ),
                    const HeadingsDescriptions(heading: 'Turf Price'),
                    TurfPriceWidget(
                      datum: datum,
                      text: 'Morning',
                      icon: Icons.wb_sunny_rounded,
                      iconColor: Colors.amber[300]!,
                    ),
                    TurfPriceWidget(
                      datum: datum,
                      text: 'Afternoon',
                      icon: Icons.sunny,
                      iconColor: const Color.fromARGB(255, 255, 143, 7),
                    ),
                    TurfPriceWidget(
                      datum: datum,
                      text: 'Evening',
                      icon: Icons.nights_stay_outlined,
                      iconColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.descriptionBookingOnpressed(datum);
          datum.turfInfo!.turfIsAvailable!
              ? Get.to(
                  () => TurfBookingPage(
                    data: datum,
                  ),
                )
              : constantObj.getSnackbarMethod(
                  message: 'Turf is currently unavailable');
        },
        backgroundColor:
            datum.turfInfo!.turfIsAvailable! ? Colors.green : Colors.red,
        label: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width - 265),
          child: SizedBox(
            width: 100,
            child: FittedBox(
              child: Text(
                datum.turfInfo!.turfIsAvailable!
                    ? '    Book   '
                    : 'Maintenance',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/turf_description/turf_description.dart';
import 'package:ticket_booking/view/wishlist/widgets/fav_turf_icon_button.dart';

class CategoryLists extends GetView<HomeController> {
  const CategoryLists({
    super.key,
    required this.index1,
  });
  final int index1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.compainedSeparatedList[index1].length,
      itemBuilder: (context, index) {
        final altrufs = controller.compainedSeparatedList[index1];

        final Datum altruf = altrufs[index];
        return GestureDetector(
          onTap: () {
            Get.to(
              () => TurfDescription(
                datum: altruf,
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(altruf.turfLogo!),
                    ),
                  ),
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        altruf.turfName.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${altruf.turfPlace}, ${altruf.turfMunicipality},  ${altruf.turfDistrict}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                FavTurfIconButton(data: altruf),
              ],
            ),
          ),
        );
      },
    );
  }
}

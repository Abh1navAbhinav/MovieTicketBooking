import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/wishlist_controller.dart';
import 'package:ticket_booking/view/turf_description/turf_description.dart';
import 'package:ticket_booking/view/wishlist/widgets/fav_turf_icon_button.dart';

class WishlisTile extends GetView<WishListController> {
  const WishlisTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(
      builder: (controllers) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.foundTurfFav.length,
        itemBuilder: (context, index) {
          final altruf = controller.foundTurfFav[index];
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
      ),
    );
  }
}

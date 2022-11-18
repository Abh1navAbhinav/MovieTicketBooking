import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/controller/wishlist_controller.dart';
import 'package:ticket_booking/global_constants/scroll_behaviour.dart';
import 'package:ticket_booking/view/wishlist/widgets/wishlist_list_tiles.dart';

class Wishlist extends GetView<WishListController> {
  Wishlist({super.key});
  final WishListController wishListController = Get.put(WishListController());
  final homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const PageScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CupertinoSearchTextField(
                  controller: controller.favTextEditController,
                  backgroundColor: Colors.grey[400],
                  onChanged: (value) {
                    controller.searchForWishListTurf(
                      value.trim(),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const WishlisTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final homePageController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextButton(
          child: const Text("Home Page"),
          onPressed: () {
            controller.logoutFunction();
          },
        ),
      ),
    );
  }
}

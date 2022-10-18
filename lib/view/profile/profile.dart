import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/profile_controller.dart';

class ProfilePage extends GetView<ProfilePageController> {
  ProfilePage({super.key});
  final profilePageController = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              controller.logoutFunction();
            },
          ),
        ),
      ),
    );
  }
}

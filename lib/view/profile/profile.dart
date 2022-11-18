import 'dart:developer';

import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              BigUserCard(
                cardColor: Colors.green,
                userName: 'abhinavpm91@gmail.com',
                userProfilePic: const AssetImage('assets/yoga.jpg'),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Update",
                  titleStyle: const TextStyle(color: Colors.black),
                  subtitle: "Tap to change your data",
                  onTap: () {
                    if (kDebugMode) {
                      log("OK");
                    }
                  },
                ),
              ),
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () async {
                      controller.logoutFunction();
                    },
                    icons: Icons.exit_to_app_rounded,
                    titleStyle: const TextStyle(color: Colors.black),
                    title: "Sign Out",
                    subtitle: 'See You Later',
                    iconStyle: IconStyle(backgroundColor: Colors.red),
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.pencil_outline,
                      iconStyle: IconStyle(),
                      title: 'Privacy Policy',
                      subtitle: "© 2022 All Rights Reserved",
                      titleStyle: const TextStyle(color: Colors.black)),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: 'About',
                    titleStyle: const TextStyle(color: Colors.black),
                    subtitle: "Learn more about Estadio App",
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

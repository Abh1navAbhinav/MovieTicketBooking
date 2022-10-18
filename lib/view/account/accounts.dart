import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/account_controller.dart';

class AccountsPage extends GetView<AccountPageController> {
  AccountsPage({super.key});
  final accountPageController = Get.put(AccountPageController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

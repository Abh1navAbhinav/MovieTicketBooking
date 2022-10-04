import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/login/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

Color kColor1 = const Color.fromARGB(255, 242, 244, 246);
Color kColor2 = const Color.fromARGB(255, 175, 201, 220);

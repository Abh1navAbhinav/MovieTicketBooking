import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

final constantObj = GlobalConstants();

class GlobalConstants {
//-----------------------------------------------------------Color---------------------------------------------------------------------------

// Color kColor1 = const Color.fromARGB(255, 242, 244, 246);
// Color kColor2 = const Color.fromARGB(255, 175, 201, 220);
  Color kColor40 = const Color.fromARGB(255, 172, 142, 248);
  Color kColor30 = const Color.fromARGB(255, 207, 172, 249);
  Color kColor20 = const Color.fromARGB(255, 231, 212, 250);
  Color kColor10 = const Color.fromARGB(255, 247, 229, 253);
  Color kDustyGrass1 = const Color.fromARGB(255, 212, 252, 121);
  Color kDustyGrass2 = const Color.fromARGB(255, 150, 230, 161);
  Color kAlreadyBookedSlots = Colors.grey.withOpacity(0.5);
  Color kUnSelectedSlotsColor = Colors.green.withOpacity(0.3);
  Color kSelectedSlotsColor = Colors.green;
  Color kSelectedSlotTextColor = Colors.white;
  Color kUnselectedSlotTextColor = Colors.black;

//----------------------------------------------------------gradient-------------------------------------------------------------------------

  gradientColors() {
    return const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 172, 142, 248),
        Color.fromARGB(255, 207, 172, 249),
        Color.fromARGB(255, 231, 212, 250),
        Color.fromARGB(255, 247, 229, 253),
      ],
    );
  }

  dustyGrassGradient() {
    return const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 212, 252, 121),
        Color.fromARGB(255, 150, 230, 161),
      ],
    );
  }

  blackAndWhitGradient() {
    return const LinearGradient(
      colors: <Color>[
        Colors.transparent,
        Color.fromARGB(220, 0, 0, 0),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

//-------------------------------------------------------TextStyle---------------------------------------------------------------------------
  TextStyle kButtonTextStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: const Color.fromARGB(255, 242, 244, 246),
  );
  TextStyle ktextStyle = GoogleFonts.roboto(
    color: Colors.black,
  );

  // get snackbar
  getSnackbarMethod({
    required String message,
    String? title,
    bool? success,
    int? duration,
  }) {
    return Get.showSnackbar(
      GetSnackBar(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        borderWidth: 2,
        borderColor: success ?? false ? Colors.green : Colors.red,
        backgroundGradient: constantObj.gradientColors(),
        borderRadius: 15,
        overlayBlur: 1,
        shouldIconPulse: true,
        icon: success ?? false
            ? Lottie.asset('assets/lottie/46436-sand-clock-timer.json')
            : const Icon(
                Icons.error,
                color: Colors.red,
              ),
        isDismissible: true,
        messageText: Text(
          message,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        duration: Duration(
          seconds: duration ?? 3,
        ),
        animationDuration: const Duration(
          seconds: 1,
        ),
      ),
    );
  }

//-------------------------------------------------error handler snackbar------------------------------------------------------------

  errorHandler(Object e) {
    if (e is DioError) {
      log("error handler========================= ${e.toString()}");
      // if (e.response?.statusCode == 401) {
      //   log(" on dio e message${e.response!.data['message']}");
      //   getSnackbarMethod(message: e.response!.data['message'].toString());
      // } else if (e.type == DioErrorType.connectTimeout) {
      //   getSnackbarMethod(message: e.response!.data['message'].toString());
      // } else if (e.type == DioErrorType.receiveTimeout) {
      //   getSnackbarMethod(message: e.response!.data['message'].toString());
      // } else if (e.type == DioErrorType.cancel) {
      //   getSnackbarMethod(message: e.response!.data['message'].toString());
      // } else if (e.type == DioErrorType.sendTimeout) {
      //   getSnackbarMethod(message: e.response!.data['message'].toString());
      // } else if (e.type == DioErrorType.response) {
      // } else if (e.type == DioErrorType.other) {
      //   getSnackbarMethod(message: e.response!.data['message'].toString());
      // }
      getSnackbarMethod(message: e.response!.data['message'].toString());
    }
    if (e is SocketException) {
      getSnackbarMethod(message: 'socketexception');
    }
  }
}

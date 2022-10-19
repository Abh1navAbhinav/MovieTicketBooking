import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/global_constants/constants.dart';

class LocationController extends GetxController {
//--------------------------variables to store current address and position-----------------------------------

  dynamic currentAddress = 'no location fetched'.obs;
  dynamic currentPosition = Geolocator.getCurrentPosition().obs;

//---------------------------To check and request user's location permission-----------------------------------

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      constantObj.getSnackbarMethod(
        message: 'Location services are disabled. Please enable the services',
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        constantObj.getSnackbarMethod(
          message: 'Location permissions are denied',
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      constantObj.getSnackbarMethod(
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
      );
      return false;
    }
    return true;
  }

//----------------------------to store the current location of the user to a variable----------------------------

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position positions) {
      currentPosition = positions;
      _getAddressFromLatLng(currentPosition);
    }).catchError((e) {
      debugPrint(e);
    });
  }

//---------------------------------Place mark variable to convert latitude and logitude to human readable form-----------------------

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      currentPosition!.latitude,
      currentPosition!.longitude,
    ).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value =
          ' ${place.subLocality}, ${place.subAdministrativeArea}';
    }).catchError((e) {
      debugPrint(e);
    });
  }

//---------------------------oninit()--------------------------------------------------------------------------

  @override
  void onInit() {
    getCurrentPosition();
    super.onInit();
  }
}

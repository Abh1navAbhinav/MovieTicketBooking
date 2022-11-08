import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_booking/config/endpoints.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/booking/booking_response.dart';
import 'package:ticket_booking/model/home/all_turf/home_response.dart';

class BookingService {
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));

//-------------------------------------Add to booked turf
  Future<AllResponse?> addToBookedTurf({
    required String bookedDate,
    required String turfId,
    required List<int> timeSlots,
  }) async {
    Map<String, dynamic> data = {
      "booking_date": bookedDate,
      "turf_id": turfId,
      "time_slot": timeSlots
    };
    try {
      final Response response = await dio.post(EndPoints.bookTurf, data: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return AllResponse.fromJson(response.data);
      }
      log('fav response after if inside try');
    } catch (e) {
      log('add to booked turf service inside catch');
      log(e.toString());
      constantObj.errorHandler(e);
    }
    return null;
  }

//--------------------------------------------Geting booked turf list from backend

  Future<BookResponse?> getBookedTurfList({required String id}) async {
    try {
      final Response response = await dio.get(EndPoints.getBookedTurf + id);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return BookResponse.fromJson(response.data);
      }
    } catch (e) {
      log('inside get booked list service catch');
      log(e.toString());
      constantObj.errorHandler(e);
    }
    return null;
  }
}

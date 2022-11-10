import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_booking/config/endpoints.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/booking/booking_request.dart';
import 'package:ticket_booking/model/booking/booking_response.dart';

class BookingService {
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));

//-------------------------------------Add to booked turf
  Future<AddBookedSlots?> addToBookedTurf({
    required AddBookedSlots model,
  }) async {
    try {
      final Response response =
          await dio.post(EndPoints.bookTurf, data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return AddBookedSlots.fromJson(response.data);
      }
    } catch (e) {
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

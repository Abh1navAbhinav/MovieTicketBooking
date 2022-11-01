import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_booking/config/endpoints.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/home/all_turf/home_response.dart';

class HomeServices {
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));

  //----------------------------------------fetch nearby turf------------------------------------------

  Future<AllResponse?> fetchNearbyTurf({
    required String location,
    required String token,
  }) async {
    try {
      final Response response = await dio.get(
        EndPoints.nearestTurf + location,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return AllResponse.fromJson(response.data);
      }
    } catch (e) {
      constantObj.errorHandler(e);
    }
    return null;
  }

  //----------------------------------------fetch all turf------------------------------------------

  Future<AllResponse?> fetchAllTurf({required String token}) async {
    try {
      final Response response = await dio.get(
        EndPoints.allTurf,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('inside fetch all turf function after if condition');
        return AllResponse.fromJson(response.data);
      }
    } catch (e) {
      constantObj.errorHandler(e);
    }
    return null;
  }
}

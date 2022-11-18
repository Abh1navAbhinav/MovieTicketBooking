import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_booking/config/endpoints.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/home/all_turf/home_response.dart';

class FavServices {
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));

//--------------------------------add to favourite service-------------------------------
  Future<AllResponse?> addToWishList(AllResponse favResponse) async {
    try {
      final Response response =
          await dio.post(EndPoints.addWishList, data: favResponse.toJson());

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return AllResponse.fromJson(response.data);
      }
    } catch (e) {
      log("add to wishlist catch${e.toString()}");
      constantObj.errorHandler(e);
    }
    return null;
  }

//--------------------------------get favourite list service-------------------------------
  Future<AllResponse?> getFav(String id) async {
    try {
      final Response response = await dio.get(EndPoints.getWishList + id);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('get fav response ${response.data}');
        return AllResponse.fromJson(response.data);
      }
    } catch (e) {
      constantObj.errorHandler(e);
    }
    return null;
  }

//--------------------------------get favourite list service-------------------------------
  Future<AllResponse?> deleteWishlist(String id) async {
    log(EndPoints.removeWishList + id);
    try {
      final Response response = await dio.delete(EndPoints.removeWishList + id);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return AllResponse.fromJson(response.data);
      }
    } catch (e) {
      constantObj.errorHandler(e);
    }
    return null;
  }
}

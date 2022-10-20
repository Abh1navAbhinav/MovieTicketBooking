import 'package:dio/dio.dart';
import 'package:ticket_booking/config/endpoints.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/model/home/nearyou/home_response.dart';

class HomeServices {
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));

  Future<HomeResponse?> fetchNearbyTurf({
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
        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
      constantObj.errorHandler(e);
    }
    return null;
  }
}

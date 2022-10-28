import 'dart:convert';

import 'package:ticket_booking/model/home/all_turf/datum.dart';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

class HomeResponse {
  HomeResponse({
    this.status,
    this.data,
    this.userId,
  });

  bool? status;
  List<Datum>? data;
  String? userId;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        status: json["status"],
        userId: json["user_id"],
        data: List<Datum>.from(
          json["data"].map(
            (x) => Datum.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "data": List<dynamic>.from(
          data!.map(
            (e) => e.toString(),
          ),
        ),
      };
}

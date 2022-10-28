import 'dart:convert';

import 'package:ticket_booking/model/home/all_turf/datum.dart';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

class HomeResponse {
  HomeResponse({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        status: json["status"],
        data: List<Datum>.from(
          json["data"].map(
            (x) => Datum.fromJson(x),
          ),
        ),
      );
}

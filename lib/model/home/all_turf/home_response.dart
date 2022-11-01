import 'dart:convert';

import 'package:ticket_booking/model/home/all_turf/datum.dart';

AllResponse homeResponseFromJson(String str) =>
    AllResponse.fromJson(json.decode(str));
String homeResponseToJson(AllResponse data) => json.encode(data.toJson());

class AllResponse {
  AllResponse({this.status, this.data, this.userId});

  bool? status;
  List<Datum>? data;
  String? userId;

  factory AllResponse.fromJson(Map<String, dynamic> json) => AllResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "turf_user_id": userId,
        "data": List<dynamic>.from(
          data!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

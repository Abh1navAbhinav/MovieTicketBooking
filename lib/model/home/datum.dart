import 'package:ticket_booking/model/home/turf_amenities.dart';
import 'package:ticket_booking/model/home/turf_categories.dart';
import 'package:ticket_booking/model/home/turf_image.dart';
import 'package:ticket_booking/model/home/turf_info.dart';
import 'package:ticket_booking/model/home/turf_time.dart';
import 'package:ticket_booking/model/home/turf_type.dart';

class Datum {
  Datum({
    this.turfCatogery,
    this.turfType,
    this.turfInfo,
    this.turfAmenities,
    this.turfImages,
    this.turfTime,
    this.id,
    this.turfCreatorId,
    this.turfName,
    this.turfPlace,
    this.turfMuncipality,
    this.turfDistrict,
    this.v,
  });

  TurfCatogery? turfCatogery;
  TurfType? turfType;
  TurfInfo? turfInfo;
  TurfAmenities? turfAmenities;
  TurfImages? turfImages;
  TurfTime? turfTime;
  String? id;
  String? turfCreatorId;
  String? turfName;
  String? turfPlace;
  String? turfMuncipality;
  String? turfDistrict;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        turfCatogery: TurfCatogery.fromJson(json["turf_catogery"]),
        turfType: TurfType.fromJson(json["turf_type"]),
        turfInfo: TurfInfo.fromJson(json["turf_info"]),
        turfAmenities: TurfAmenities.fromJson(json["turf_amenities"]),
        turfImages: TurfImages.fromJson(json["turf_images"]),
        turfTime: TurfTime.fromJson(json["turf_time"]),
        id: json["_id"],
        turfCreatorId: json["turf_creator_id"],
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
        turfMuncipality: json["turf_muncipality"],
        turfDistrict: json["turf_district"],
        v: json["__v"],
      );
}

import 'package:ticket_booking/model/home/all_turf/turf_amenities.dart';
import 'package:ticket_booking/model/home/all_turf/turf_categories.dart';
import 'package:ticket_booking/model/home/all_turf/turf_image.dart';
import 'package:ticket_booking/model/home/all_turf/turf_info.dart';
import 'package:ticket_booking/model/home/all_turf/turf_price.dart';
import 'package:ticket_booking/model/home/all_turf/turf_time.dart';
import 'package:ticket_booking/model/home/all_turf/turf_type.dart';

class Datum {
  Datum({
    this.turfCategory,
    this.turfType,
    this.turfInfo,
    this.turfAmenities,
    this.turfImages,
    this.turfTime,
    this.id,
    this.turfCreatorId,
    this.turfName,
    this.turfPlace,
    this.turfMunicipality,
    this.turfDistrict,
    this.turfPrice,
    this.turfLogo,
    this.v,
  });

  TurfCategory? turfCategory;
  TurfType? turfType;
  TurfInfo? turfInfo;
  TurfAmenities? turfAmenities;
  TurfImages? turfImages;
  TurfTime? turfTime;
  String? id;
  String? turfCreatorId;
  String? turfName;
  String? turfPlace;
  String? turfMunicipality;
  String? turfDistrict;
  TurfPrice? turfPrice;
  String? turfLogo;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        turfCategory: TurfCategory.fromJson(json["turf_category"]),
        turfType: TurfType.fromJson(json["turf_type"]),
        turfInfo: TurfInfo.fromJson(json["turf_info"]),
        turfAmenities: TurfAmenities.fromJson(json["turf_amenities"]),
        turfImages: TurfImages.fromJson(json["turf_images"]),
        turfTime: TurfTime.fromJson(json["turf_time"]),
        id: json["_id"],
        turfCreatorId: json["turf_creator_id"],
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
        turfMunicipality: json["turf_municipality"],
        turfDistrict: json["turf_district"],
        turfPrice: TurfPrice.fromJson(json["turf_price"]),
        turfLogo: json["turf_logo"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "turf_category": turfCategory!.toJson(),
        "turf_type": turfType!.toJson(),
        "turf_info": turfInfo!.toJson(),
        "turf_amenities": turfAmenities!.toJson(),
        "turf_time": turfName,
        "_id": id,
        "turf_creator_id": turfCreatorId,
        "turf_name": turfName,
        "turf_place": turfPlace,
        "turf_municipality": turfMunicipality,
        "turf_district": turfDistrict,
        "turf_price": turfPrice!.toJson(),
        "turf_logo": turfLogo,
        "__v": v,
      };
}

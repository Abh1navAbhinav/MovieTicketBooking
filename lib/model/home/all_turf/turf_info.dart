class TurfInfo {
  TurfInfo({
    this.turfIsAvailable,
    this.turfRating,
    this.turfMap,
  });

  bool? turfIsAvailable;
  double? turfRating;
  String? turfMap;

  factory TurfInfo.fromJson(Map<String, dynamic> json) => TurfInfo(
        turfIsAvailable: json["turf_isAvailable"],
        turfRating: json["turf_rating"].toDouble(),
        turfMap: json["turf_map"],
      );

  Map<String, dynamic> toJson() => {
        "turf_isAvailable": turfIsAvailable,
        "turf_rating": turfRating!.toDouble(),
        "turf_map": turfMap,
      };
}

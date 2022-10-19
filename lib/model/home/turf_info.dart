class TurfInfo {
  TurfInfo({
    this.turfIsAvailale,
    this.turfRating,
    this.turfMap,
  });

  bool? turfIsAvailale;
  double? turfRating;
  String? turfMap;

  factory TurfInfo.fromJson(Map<String, dynamic> json) => TurfInfo(
        turfIsAvailale: json["turf_isAvailale"],
        turfRating: json["turf_rating"].toDouble(),
        turfMap: json["turf_map"],
      );
}

class TurfType {
  TurfType({
    this.turfSevens,
    this.turfFives,
  });

  bool? turfSevens;
  bool? turfFives;

  factory TurfType.fromJson(Map<String, dynamic> json) => TurfType(
        turfSevens: json["turf_sevens"],
        turfFives: json["turf_sixes"],
      );

  Map<String, dynamic> toJson() => {
        "turf_sevens": turfSevens,
        "turf_sixes": turfFives,
      };
}

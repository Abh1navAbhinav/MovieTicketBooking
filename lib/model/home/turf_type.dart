class TurfType {
  TurfType({
    this.turfSevens,
    this.turfSixes,
  });

  bool? turfSevens;
  bool? turfSixes;

  factory TurfType.fromJson(Map<String, dynamic> json) => TurfType(
        turfSevens: json["turf_sevens"],
        turfSixes: json["turf_sixes"],
      );
}

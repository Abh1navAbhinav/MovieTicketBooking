class TurfCategory {
  TurfCategory({
    this.turfCricket,
    this.turfFootball,
    this.turfBadminton,
    this.turfYoga,
  });

  bool? turfCricket;
  bool? turfFootball;
  bool? turfBadminton;
  bool? turfYoga;

  factory TurfCategory.fromJson(Map<String, dynamic> json) => TurfCategory(
        turfCricket: json["turf_cricket"],
        turfFootball: json["turf_football"],
        turfBadminton: json["turf_badminton"],
        turfYoga: json["turf_yoga"],
      );
}

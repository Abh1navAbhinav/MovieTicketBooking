class TurfImages {
  TurfImages({
    this.turfImages1,
    this.turfImages2,
    this.turfImages3,
  });

  String? turfImages1;
  String? turfImages2;
  String? turfImages3;

  factory TurfImages.fromJson(Map<String, dynamic> json) => TurfImages(
        turfImages1: json["turf_images1"],
        turfImages2: json["turf_images2"],
        turfImages3: json["turf_images3"],
      );

  Map<String, dynamic> toJson() => {
        "turf_images1": turfImages1,
        "turf_images2": turfImages2,
        "turf_images3": turfImages3,
      };
}

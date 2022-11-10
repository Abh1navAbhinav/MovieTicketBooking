class AddBookedSlots {
  AddBookedSlots({
    this.bookingDate,
    this.turfId,
    this.timeSlot,
    this.status,
    this.message,
  });
  bool? status;
  String? message;
  String? bookingDate;
  String? turfId;
  List<int>? timeSlot;

  factory AddBookedSlots.fromJson(Map<String, dynamic> json) => AddBookedSlots(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "booking_date": bookingDate,
        "turf_id": turfId,
        "time_slot": List<dynamic>.from(timeSlot!.map((x) => x)),
      };
}

class TurfTime {
  TurfTime({
    this.timeMorningStart,
    this.timeMorningEnd,
    this.timeAfternoonStart,
    this.timeAfternoonEnd,
    this.timeEveningStart,
    this.timeEveningEnd,
  });

  int? timeMorningStart;
  int? timeMorningEnd;
  int? timeAfternoonStart;
  int? timeAfternoonEnd;
  int? timeEveningStart;
  int? timeEveningEnd;

  factory TurfTime.fromJson(Map<String, dynamic> json) => TurfTime(
        timeMorningStart: json["time_morning_start"],
        timeMorningEnd: json["time_morning_end"],
        timeAfternoonStart: json["time_afternoon_start"],
        timeAfternoonEnd: json["time_afternoon_end"],
        timeEveningStart: json["time_evening_start"],
        timeEveningEnd: json["time_evening_end"],
      );

  Map<String, dynamic> toJson() => {
        "time_morning_start": timeMorningStart,
        "time_morning_end": timeMorningEnd,
        "time_afternoon_start": timeAfternoonStart,
        "time_afternoon_end": timeAfternoonEnd,
        "time_evening_start": timeEveningStart,
        "time_evening_end": timeEveningEnd,
      };
}

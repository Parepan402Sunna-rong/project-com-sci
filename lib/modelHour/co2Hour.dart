// To parse this JSON data, do
//
//     final co2Hour = co2HourFromJson(jsonString);

import 'dart:convert';

List<Co2Hour> co2HourFromJson(String str) =>
    List<Co2Hour>.from(json.decode(str).map((x) => Co2Hour.fromJson(x)));

String co2HourToJson(List<Co2Hour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Co2Hour {
  Co2Hour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory Co2Hour.fromJson(Map<String, dynamic> json) => Co2Hour(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}

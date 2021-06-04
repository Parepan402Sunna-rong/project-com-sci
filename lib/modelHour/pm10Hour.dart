// To parse this JSON data, do
//
//     final pm10Hour = pm10HourFromJson(jsonString);

import 'dart:convert';

List<Pm10Hour> pm10HourFromJson(String str) =>
    List<Pm10Hour>.from(json.decode(str).map((x) => Pm10Hour.fromJson(x)));

String pm10HourToJson(List<Pm10Hour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm10Hour {
  Pm10Hour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory Pm10Hour.fromJson(Map<String, dynamic> json) => Pm10Hour(
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

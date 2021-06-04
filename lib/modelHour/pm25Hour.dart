// To parse this JSON data, do
//
//     final pm25Hour = pm25HourFromJson(jsonString);

import 'dart:convert';

List<Pm25Hour> pm25HourFromJson(String str) =>
    List<Pm25Hour>.from(json.decode(str).map((x) => Pm25Hour.fromJson(x)));

String pm25HourToJson(List<Pm25Hour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm25Hour {
  Pm25Hour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory Pm25Hour.fromJson(Map<String, dynamic> json) => Pm25Hour(
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

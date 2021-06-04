// To parse this JSON data, do
//
//     final pm1Hour = pm1HourFromJson(jsonString);

import 'dart:convert';

List<Pm1Hour> pm1HourFromJson(String str) =>
    List<Pm1Hour>.from(json.decode(str).map((x) => Pm1Hour.fromJson(x)));

String pm1HourToJson(List<Pm1Hour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm1Hour {
  Pm1Hour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory Pm1Hour.fromJson(Map<String, dynamic> json) => Pm1Hour(
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

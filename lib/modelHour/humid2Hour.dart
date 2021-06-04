// To parse this JSON data, do
//
//     final humid2Hour = humid2HourFromJson(jsonString);

import 'dart:convert';

List<Humid2Hour> humid2HourFromJson(String str) =>
    List<Humid2Hour>.from(json.decode(str).map((x) => Humid2Hour.fromJson(x)));

String humid2HourToJson(List<Humid2Hour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Humid2Hour {
  Humid2Hour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory Humid2Hour.fromJson(Map<String, dynamic> json) => Humid2Hour(
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

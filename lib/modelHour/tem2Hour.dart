// To parse this JSON data, do
//
//     final tem2Hour = tem2HourFromJson(jsonString);

import 'dart:convert';

List<Tem2Hour> tem2HourFromJson(String str) =>
    List<Tem2Hour>.from(json.decode(str).map((x) => Tem2Hour.fromJson(x)));

String tem2HourToJson(List<Tem2Hour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tem2Hour {
  Tem2Hour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory Tem2Hour.fromJson(Map<String, dynamic> json) => Tem2Hour(
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

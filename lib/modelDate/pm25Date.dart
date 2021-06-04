// To parse this JSON data, do
//
//     final pm25Date = pm25DateFromJson(jsonString);

import 'dart:convert';

List<Pm25Date> pm25DateFromJson(String str) =>
    List<Pm25Date>.from(json.decode(str).map((x) => Pm25Date.fromJson(x)));

String pm25DateToJson(List<Pm25Date> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm25Date {
  Pm25Date({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory Pm25Date.fromJson(Map<String, dynamic> json) => Pm25Date(
        value: json["value"],
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

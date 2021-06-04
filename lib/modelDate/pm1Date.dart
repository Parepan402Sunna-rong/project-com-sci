// To parse this JSON data, do
//
//     final pm1Date = pm1DateFromJson(jsonString);

import 'dart:convert';

List<Pm1Date> pm1DateFromJson(String str) =>
    List<Pm1Date>.from(json.decode(str).map((x) => Pm1Date.fromJson(x)));

String pm1DateToJson(List<Pm1Date> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm1Date {
  Pm1Date({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory Pm1Date.fromJson(Map<String, dynamic> json) => Pm1Date(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

// To parse this JSON data, do
//
//     final pm10Date = pm10DateFromJson(jsonString);

import 'dart:convert';

List<Pm10Date> pm10DateFromJson(String str) =>
    List<Pm10Date>.from(json.decode(str).map((x) => Pm10Date.fromJson(x)));

String pm10DateToJson(List<Pm10Date> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm10Date {
  Pm10Date({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory Pm10Date.fromJson(Map<String, dynamic> json) => Pm10Date(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

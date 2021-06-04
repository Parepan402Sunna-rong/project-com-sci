// To parse this JSON data, do
//
//     final humid2Date = humid2DateFromJson(jsonString);

import 'dart:convert';

List<Humid2Date> humid2DateFromJson(String str) =>
    List<Humid2Date>.from(json.decode(str).map((x) => Humid2Date.fromJson(x)));

String humid2DateToJson(List<Humid2Date> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Humid2Date {
  Humid2Date({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory Humid2Date.fromJson(Map<String, dynamic> json) => Humid2Date(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

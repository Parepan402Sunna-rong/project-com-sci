// To parse this JSON data, do
//
//     final tem2Date = tem2DateFromJson(jsonString);

import 'dart:convert';

List<Tem2Date> tem2DateFromJson(String str) =>
    List<Tem2Date>.from(json.decode(str).map((x) => Tem2Date.fromJson(x)));

String tem2DateToJson(List<Tem2Date> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tem2Date {
  Tem2Date({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory Tem2Date.fromJson(Map<String, dynamic> json) => Tem2Date(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

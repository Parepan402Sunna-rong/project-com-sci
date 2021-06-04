// To parse this JSON data, do
//
//     final co2Date = co2DateFromJson(jsonString);

import 'dart:convert';

List<Co2Date> co2DateFromJson(String str) =>
    List<Co2Date>.from(json.decode(str).map((x) => Co2Date.fromJson(x)));

String co2DateToJson(List<Co2Date> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Co2Date {
  Co2Date({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory Co2Date.fromJson(Map<String, dynamic> json) => Co2Date(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

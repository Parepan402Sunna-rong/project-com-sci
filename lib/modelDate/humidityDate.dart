// To parse this JSON data, do
//
//     final humidityDate = humidityDateFromJson(jsonString);

import 'dart:convert';

List<HumidityDate> humidityDateFromJson(String str) => List<HumidityDate>.from(
    json.decode(str).map((x) => HumidityDate.fromJson(x)));

String humidityDateToJson(List<HumidityDate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HumidityDate {
  HumidityDate({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory HumidityDate.fromJson(Map<String, dynamic> json) => HumidityDate(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

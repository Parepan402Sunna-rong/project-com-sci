// To parse this JSON data, do
//
//     final humidityMonth = humidityMonthFromJson(jsonString);

import 'dart:convert';

List<HumidityMonth> humidityMonthFromJson(String str) =>
    List<HumidityMonth>.from(
        json.decode(str).map((x) => HumidityMonth.fromJson(x)));

String humidityMonthToJson(List<HumidityMonth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HumidityMonth {
  HumidityMonth({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory HumidityMonth.fromJson(Map<String, dynamic> json) => HumidityMonth(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

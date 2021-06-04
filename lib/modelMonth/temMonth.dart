// To parse this JSON data, do
//
//     final temperatureMonth = temperatureMonthFromJson(jsonString);

import 'dart:convert';

List<TemperatureMonth> temperatureMonthFromJson(String str) =>
    List<TemperatureMonth>.from(
        json.decode(str).map((x) => TemperatureMonth.fromJson(x)));

String temperatureMonthToJson(List<TemperatureMonth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TemperatureMonth {
  TemperatureMonth({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory TemperatureMonth.fromJson(Map<String, dynamic> json) =>
      TemperatureMonth(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

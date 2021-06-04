// To parse this JSON data, do
//
//     final pm10Month = pm10MonthFromJson(jsonString);

import 'dart:convert';

List<Pm10Month> pm10MonthFromJson(String str) =>
    List<Pm10Month>.from(json.decode(str).map((x) => Pm10Month.fromJson(x)));

String pm10MonthToJson(List<Pm10Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm10Month {
  Pm10Month({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory Pm10Month.fromJson(Map<String, dynamic> json) => Pm10Month(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

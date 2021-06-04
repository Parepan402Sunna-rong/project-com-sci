// To parse this JSON data, do
//
//     final pm1Month = pm1MonthFromJson(jsonString);

import 'dart:convert';

List<Pm1Month> pm1MonthFromJson(String str) =>
    List<Pm1Month>.from(json.decode(str).map((x) => Pm1Month.fromJson(x)));

String pm1MonthToJson(List<Pm1Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm1Month {
  Pm1Month({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory Pm1Month.fromJson(Map<String, dynamic> json) => Pm1Month(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

// To parse this JSON data, do
//
//     final pm25Month = pm25MonthFromJson(jsonString);

import 'dart:convert';

List<Pm25Month> pm25MonthFromJson(String str) =>
    List<Pm25Month>.from(json.decode(str).map((x) => Pm25Month.fromJson(x)));

String pm25MonthToJson(List<Pm25Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pm25Month {
  Pm25Month({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory Pm25Month.fromJson(Map<String, dynamic> json) => Pm25Month(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

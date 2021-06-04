// To parse this JSON data, do
//
//     final humid2Month = humid2MonthFromJson(jsonString);

import 'dart:convert';

List<Humid2Month> humid2MonthFromJson(String str) => List<Humid2Month>.from(
    json.decode(str).map((x) => Humid2Month.fromJson(x)));

String humid2MonthToJson(List<Humid2Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Humid2Month {
  Humid2Month({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory Humid2Month.fromJson(Map<String, dynamic> json) => Humid2Month(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

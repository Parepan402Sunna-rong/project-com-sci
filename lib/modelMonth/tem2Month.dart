// To parse this JSON data, do
//
//     final tem2Month = tem2MonthFromJson(jsonString);

import 'dart:convert';

List<Tem2Month> tem2MonthFromJson(String str) =>
    List<Tem2Month>.from(json.decode(str).map((x) => Tem2Month.fromJson(x)));

String tem2MonthToJson(List<Tem2Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tem2Month {
  Tem2Month({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory Tem2Month.fromJson(Map<String, dynamic> json) => Tem2Month(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

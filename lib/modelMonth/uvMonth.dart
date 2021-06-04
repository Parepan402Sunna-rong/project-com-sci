// To parse this JSON data, do
//
//     final uvMonth = uvMonthFromJson(jsonString);

import 'dart:convert';

List<UvMonth> uvMonthFromJson(String str) =>
    List<UvMonth>.from(json.decode(str).map((x) => UvMonth.fromJson(x)));

String uvMonthToJson(List<UvMonth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UvMonth {
  UvMonth({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory UvMonth.fromJson(Map<String, dynamic> json) => UvMonth(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

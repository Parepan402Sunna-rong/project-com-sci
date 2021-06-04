// To parse this JSON data, do
//
//     final co2Month = co2MonthFromJson(jsonString);

import 'dart:convert';

List<Co2Month> co2MonthFromJson(String str) =>
    List<Co2Month>.from(json.decode(str).map((x) => Co2Month.fromJson(x)));

String co2MonthToJson(List<Co2Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Co2Month {
  Co2Month({
    this.value,
    this.date,
  });

  double value;
  String date;

  factory Co2Month.fromJson(Map<String, dynamic> json) => Co2Month(
        value: json["value"].toDouble(),
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Date": date,
      };
}

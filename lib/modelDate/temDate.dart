// To parse this JSON data, do
//
//     final temDate = temDateFromJson(jsonString);

import 'dart:convert';

List<TemDate> temDateFromJson(String str) =>
    List<TemDate>.from(json.decode(str).map((x) => TemDate.fromJson(x)));

String temDateToJson(List<TemDate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TemDate {
  TemDate({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory TemDate.fromJson(Map<String, dynamic> json) => TemDate(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

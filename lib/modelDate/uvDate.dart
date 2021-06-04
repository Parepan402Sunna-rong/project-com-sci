// To parse this JSON data, do
//
//     final uvDate = uvDateFromJson(jsonString);

import 'dart:convert';

List<UvDate> uvDateFromJson(String str) =>
    List<UvDate>.from(json.decode(str).map((x) => UvDate.fromJson(x)));

String uvDateToJson(List<UvDate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UvDate {
  UvDate({
    this.value,
    this.day,
  });

  double value;
  DateTime day;

  factory UvDate.fromJson(Map<String, dynamic> json) => UvDate(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}

// To parse this JSON data, do
//
//     final uvHour = uvHourFromJson(jsonString);

import 'dart:convert';

List<UvHour> uvHourFromJson(String str) =>
    List<UvHour>.from(json.decode(str).map((x) => UvHour.fromJson(x)));

String uvHourToJson(List<UvHour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UvHour {
  UvHour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory UvHour.fromJson(Map<String, dynamic> json) => UvHour(
        value: json["value"].toDouble(),
        day: DateTime.parse(json["Day"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "Day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}

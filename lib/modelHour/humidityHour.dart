// To parse this JSON data, do
//
//     final humidityHour = humidityHourFromJson(jsonString);

import 'dart:convert';

List<HumidityHour> humidityHourFromJson(String str) => List<HumidityHour>.from(
    json.decode(str).map((x) => HumidityHour.fromJson(x)));

String humidityHourToJson(List<HumidityHour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HumidityHour {
  HumidityHour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory HumidityHour.fromJson(Map<String, dynamic> json) => HumidityHour(
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

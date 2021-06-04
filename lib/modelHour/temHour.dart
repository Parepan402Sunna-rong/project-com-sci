// To parse this JSON data, do
//
//     final temperatureHour = temperatureHourFromJson(jsonString);

import 'dart:convert';

List<TemperatureHour> temperatureHourFromJson(String str) =>
    List<TemperatureHour>.from(
        json.decode(str).map((x) => TemperatureHour.fromJson(x)));

String temperatureHourToJson(List<TemperatureHour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TemperatureHour {
  TemperatureHour({
    this.value,
    this.day,
    this.time,
  });

  double value;
  DateTime day;
  String time;

  factory TemperatureHour.fromJson(Map<String, dynamic> json) =>
      TemperatureHour(
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

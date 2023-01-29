import 'package:json_annotation/json_annotation.dart';

part 'res.g.dart';

@JsonSerializable()
class WeatherRes {
  final String weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final DateTime date;

  WeatherRes({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory WeatherRes.fromJson(Map<String, dynamic> json) => _$WeatherResFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResToJson(this);
}

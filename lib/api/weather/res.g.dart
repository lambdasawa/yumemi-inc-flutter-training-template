// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRes _$WeatherResFromJson(Map<String, dynamic> json) => WeatherRes(
      weatherCondition: json['weather_condition'] as String,
      maxTemperature: json['max_temperature'] as int,
      minTemperature: json['min_temperature'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$WeatherResToJson(WeatherRes instance) =>
    <String, dynamic>{
      'weather_condition': instance.weatherCondition,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
      'date': instance.date.toIso8601String(),
    };

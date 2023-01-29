// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherReq _$WeatherReqFromJson(Map<String, dynamic> json) => WeatherReq(
      area: json['area'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$WeatherReqToJson(WeatherReq instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date?.toIso8601String(),
    };

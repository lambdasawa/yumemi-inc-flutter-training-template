import 'package:json_annotation/json_annotation.dart';

part 'req.g.dart';

@JsonSerializable()
class WeatherReq {
  final String area;

  final DateTime? date;

  WeatherReq({required this.area, required this.date});

  factory WeatherReq.fromJson(Map<String, dynamic> json) => _$WeatherReqFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReqToJson(this);
}

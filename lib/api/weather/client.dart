import 'dart:convert';

import 'package:flutter_training/api/weather/req.dart';
import 'package:flutter_training/api/weather/res.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherClient {
  final yumemiWeather = YumemiWeather();

  WeatherRes fetch(WeatherReq req) {
    final reqJSON = req.toJson();

    final resJSON = yumemiWeather.fetchWeather(jsonEncode(reqJSON));

    return WeatherRes.fromJson(jsonDecode(resJSON) as Map<String, dynamic>);
  }
}

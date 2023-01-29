import 'package:flutter/material.dart';
import 'package:flutter_training/page/green.dart';
import 'package:flutter_training/page/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        WeatherPage.routes:
            (context) => const WeatherPage(title: 'Weather Page'),
      },
      home: const GreenPage(title: 'Flutter Demo Home Page'),
    );
  }
}

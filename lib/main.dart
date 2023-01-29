import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final yumemiWeather = YumemiWeather();

  @override
  Widget build(BuildContext context) {
    final placeholderSize = MediaQuery.of(context).size.width / 2;

    final weatherCondition = yumemiWeather.fetchSimpleWeather();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: placeholderSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TemperatureGroup(
                  size: placeholderSize,
                  weather: weatherCondition,
              ),
              const Expanded(child: TemperatureButtons()),
            ],
          ),
        ),
      ),
    );
  }
}

class TemperatureButtons extends StatelessWidget {
  const TemperatureButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}

class TemperatureGroup extends StatelessWidget {
  const TemperatureGroup({
    super.key,
    required this.size,
    required this.weather,
  });

  final double size;
  final String weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
            'assets/images/icons/$weather.svg',
            height: size,
            width: size,
        ),
        Row(
          children: const [
            TemperatureText(color: Colors.blue),
            TemperatureText(color: Colors.red),
          ],
        )
      ],
    );
  }
}

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          '** ℃',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
        ),
      ),
    );
  }
}

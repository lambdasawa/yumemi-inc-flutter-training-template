import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, required this.title});

  static const routes = '/weather';

  final String title;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final yumemiWeather = YumemiWeather();

  String? weatherCondition;

  @override
  void initState() {
    super.initState();
    reload();
  }

  void close() {
    Navigator.of(context).pop();
  }

  void reload() {
    try {
      setState(() {
        weatherCondition = yumemiWeather.fetchThrowsWeather('tokyo');
      });
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.unknown:
          SchedulerBinding.instance.addPostFrameCallback(
            (_) => showDialog<void>(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('未知のエラーが発生しました。'),
                content: Text('しばらく時間をおいて再度実行してください'),
              ),
            ),
          );
          break;
        case YumemiWeatherError.invalidParameter:
          SchedulerBinding.instance.addPostFrameCallback(
            (_) => showDialog<void>(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('不正なパラメータが入力されました。'),
                content: Text('入力値を再確認してもう一度実行してください。'),
              ),
            ),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final placeholderSize = MediaQuery.of(context).size.width / 2;

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
              _TemperatureGroup(
                size: placeholderSize,
                weather: weatherCondition,
              ),
              Expanded(
                child: _TemperatureButtons(
                  onClose: close,
                  onReload: reload,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TemperatureButtons extends StatelessWidget {
  const _TemperatureButtons({
    super.key,
    required this.onClose,
    required this.onReload,
  });

  final VoidCallback onClose;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onClose,
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: onReload,
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}

class _TemperatureGroup extends StatelessWidget {
  const _TemperatureGroup({
    required this.size,
    required this.weather,
  });

  final double size;
  final String? weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (weather != null)
          SvgPicture.asset(
            'assets/images/icons/$weather.svg',
            height: size,
            width: size,
          )
        else
          Placeholder(fallbackHeight: size, fallbackWidth: size),
        Row(
          children: const [
            _TemperatureText(color: Colors.blue),
            _TemperatureText(color: Colors.red),
          ],
        )
      ],
    );
  }
}

class _TemperatureText extends StatelessWidget {
  const _TemperatureText({
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

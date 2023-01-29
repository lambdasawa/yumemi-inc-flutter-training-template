import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              _TemperatureGroup(
                size: placeholderSize,
                weather: weatherCondition,
              ),
              Expanded(
                child: _TemperatureButtons(
                  onClose: () {
                    Navigator.of(context).pop();
                  },
                  onReload: () {
                    setState(() {});
                  },
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

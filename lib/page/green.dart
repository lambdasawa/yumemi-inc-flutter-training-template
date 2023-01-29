import 'package:flutter/material.dart';
import 'package:flutter_training/page/weather.dart';
import 'package:flutter_training/utils/after_end_of_frame.dart';

class GreenPage extends StatefulWidget {
  const GreenPage({super.key, required this.title});

  final String title;

  @override
  State<GreenPage> createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage> with AfterEndOfFrame {
  @override
  void initState() {
    super.initState();
    print('super.initState();');

    pushWeatherPage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('super.didChangeDependencies();');
  }

  @override
  void didUpdateWidget(GreenPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('super.didUpdateWidget(oldWidget);');
  }

  Future<void> pushWeatherPage() async {
    await runAfterEndOfFrame(() async {
      await Future<void>.delayed(const Duration(milliseconds: 500));

      if (!context.mounted) return;

      await Navigator.pushNamed(context, WeatherPage.routes);

      await pushWeatherPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.green,
      body: const SizedBox.shrink(),
    );
  }
}

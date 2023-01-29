import 'package:flutter/material.dart';

mixin AfterEndOfFrame<T extends StatefulWidget> on State<T> {
  Future<void> runAfterEndOfFrame(Future<void> Function() f) async {
    await WidgetsBinding.instance.endOfFrame;

    await f();
  }
}

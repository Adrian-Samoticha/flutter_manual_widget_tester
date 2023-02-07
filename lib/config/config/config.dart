import 'package:flutter/material.dart';

import 'config_data.dart';
export 'config_data.dart';

class Config extends InheritedWidget {
  /// Creates a configuration widget for the [ManualWidgetTester].
  const Config({super.key, required super.child, required this.data});

  static ConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Config>()!.data;
  }

  final ConfigData data;

  @override
  bool updateShouldNotify(Config oldWidget) {
    return data != oldWidget.data;
  }
}

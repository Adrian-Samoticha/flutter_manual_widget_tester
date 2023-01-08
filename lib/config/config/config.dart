import 'package:flutter/material.dart';

import 'config_data.dart';
export 'config_data.dart';

class Config extends InheritedWidget {
  /// Creates a configuration widget for the [ManualWidgetTester].
  ///
  /// The [doubleEditorInfiniteScrollViewRange] is the range of the double
  /// editor infinite scroll view.
  ///
  /// The [doubleEditorInfiniteScrollViewScrollSpeedFactor] is the scroll speed
  /// factor of the double editor infinite scroll view.
  const Config({super.key, required super.child, required this.data});

  final ConfigData data;

  static ConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Config>()!.data;
  }

  @override
  bool updateShouldNotify(Config oldWidget) {
    return data != oldWidget.data;
  }
}

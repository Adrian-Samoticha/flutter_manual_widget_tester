import 'package:flutter/material.dart';

class ConfigData {
  const ConfigData(
      {required this.doubleEditorInfiniteScrollViewRange,
      required this.doubleEditorInfiniteScrollViewScrollSpeedFactor});

  /// The range of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewRange;

  /// The scroll speed factor of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewScrollSpeedFactor;

  @override
  bool operator ==(o) =>
      o is ConfigData &&
      doubleEditorInfiniteScrollViewRange ==
          o.doubleEditorInfiniteScrollViewRange &&
      doubleEditorInfiniteScrollViewScrollSpeedFactor ==
          o.doubleEditorInfiniteScrollViewScrollSpeedFactor;

  @override
  int get hashCode => Object.hash(doubleEditorInfiniteScrollViewRange,
      doubleEditorInfiniteScrollViewScrollSpeedFactor);
}

class Config extends InheritedWidget {
  /// Creates a configuration object for the [ManualWidgetTester].
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

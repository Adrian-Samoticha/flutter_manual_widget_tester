import 'package:flutter/material.dart';

import 'theme_data.dart';

class ManualWidgetTesterTheme extends InheritedWidget {
  const ManualWidgetTesterTheme({
    super.key,
    required super.child,
    required this.themeData,
  });

  static ManualWidgetTesterThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<ManualWidgetTesterTheme>();

    assert(theme != null);

    return theme!.themeData;
  }

  final ManualWidgetTesterThemeData themeData;

  @override
  bool updateShouldNotify(ManualWidgetTesterTheme oldWidget) {
    return themeData != oldWidget.themeData;
  }
}

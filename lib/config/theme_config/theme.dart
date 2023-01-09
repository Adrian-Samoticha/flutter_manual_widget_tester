import 'package:flutter/material.dart';

import 'theme_settings.dart';

class ManualWidgetTesterTheme extends InheritedWidget {
  const ManualWidgetTesterTheme(
      {super.key, required super.child, required this.themeSettings});

  final ManualWidgetTesterThemeSettings themeSettings;

  static ManualWidgetTesterThemeSettings of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<ManualWidgetTesterTheme>();

    assert(theme != null);
    return theme!.themeSettings;
  }

  @override
  bool updateShouldNotify(ManualWidgetTesterTheme oldWidget) {
    return themeSettings != oldWidget.themeSettings;
  }
}

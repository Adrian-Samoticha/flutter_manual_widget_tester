import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class TabLightReflection extends StatelessWidget {
  const TabLightReflection({
    Key? key,
    required this.isFocused,
    required this.themeSettings,
  }) : super(key: key);

  final bool isFocused;
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !isFocused
          ? null
          : themeSettings.tabTheme.tabLightReflectionBoxDecoration,
    );
  }
}

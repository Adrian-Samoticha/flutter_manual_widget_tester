import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class TabLightReflection extends StatelessWidget {
  const TabLightReflection({
    Key? key,
    required this.isSelected,
    required this.themeSettings,
  }) : super(key: key);

  final bool isSelected;
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !isSelected ? null : themeSettings.tabLightReflectionBoxDecoration,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class SelectedTabDecoration extends StatelessWidget {
  const SelectedTabDecoration({
    Key? key,
    required this.themeSettings,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: themeSettings.selectedTabAccentColorDecorationWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
              themeSettings.selectedTabAccentColorDecorationWidth),
          bottomRight: Radius.circular(
              themeSettings.selectedTabAccentColorDecorationWidth),
        ),
        color: themeSettings.accentColor,
      ),
    );
  }
}

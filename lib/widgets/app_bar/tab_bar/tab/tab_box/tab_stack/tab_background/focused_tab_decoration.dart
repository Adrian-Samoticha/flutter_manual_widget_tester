import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class FocusedTabDecoration extends StatelessWidget {
  const FocusedTabDecoration({
    Key? key,
    required this.themeSettings,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: themeSettings.focusedTabAccentColorDecorationWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
              themeSettings.focusedTabAccentColorDecorationWidth),
          bottomRight: Radius.circular(
              themeSettings.focusedTabAccentColorDecorationWidth),
        ),
        color: themeSettings.accentColor,
      ),
    );
  }
}

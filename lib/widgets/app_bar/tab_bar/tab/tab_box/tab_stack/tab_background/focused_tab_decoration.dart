import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class FocusedTabDecoration extends StatelessWidget {
  const FocusedTabDecoration({
    Key? key,
    required this.themeSettings,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: themeSettings.tabTheme.focusedTabAccentColorDecorationWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
              themeSettings.tabTheme.focusedTabAccentColorDecorationWidth),
          bottomRight: Radius.circular(
              themeSettings.tabTheme.focusedTabAccentColorDecorationWidth),
        ),
        color: themeSettings.generalTheme.accentColor,
      ),
    );
  }
}

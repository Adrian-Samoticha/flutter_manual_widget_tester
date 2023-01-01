import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class TabText extends StatelessWidget {
  const TabText({
    Key? key,
    required this.themeSettings,
    required this.widgetName,
    required this.isFocused,
    required this.isBeingHovered,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String widgetName;
  final bool isFocused;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isFocused) {
      return Center(
          child: Text(
        widgetName,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: themeSettings.tabTheme.tabTextStyle,
      ));
    }

    return Center(
        child: AnimatedOpacity(
      duration: themeSettings.tabTheme.unfocusedTabOpacityChangeDuration,
      opacity: isBeingHovered
          ? themeSettings.tabTheme.unfocusedHoveredTabOpacity
          : themeSettings.tabTheme.unfocusedNotHoveredTabOpacity,
      child: Text(
        widgetName,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: themeSettings.tabTheme.tabTextStyle,
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({
    Key? key,
    required this.themeSettings,
    required this.icon,
    required this.iconColor,
    required this.isFocused,
    required this.isBeingHovered,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final IconData icon;
  final Color? iconColor;
  final bool isFocused;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isFocused) {
      return Padding(
        padding: themeSettings.tabTheme.tabIconPadding,
        child: Icon(
          icon,
          size: themeSettings.tabTheme.tabIconSize,
          color: iconColor,
        ),
      );
    }

    return AnimatedOpacity(
      duration: themeSettings.tabTheme.unfocusedTabOpacityChangeDuration,
      opacity: isBeingHovered
          ? themeSettings.tabTheme.unfocusedHoveredTabOpacity
          : themeSettings.tabTheme.unfocusedNotHoveredTabOpacity,
      child: Padding(
        padding: themeSettings.tabTheme.tabIconPadding,
        child: Icon(
          icon,
          size: themeSettings.tabTheme.tabIconSize,
          color: iconColor,
        ),
      ),
    );
  }
}

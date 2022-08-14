import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({
    Key? key,
    required this.themeSettings,
    required this.icon,
    required this.iconColor,
    required this.isSelected,
    required this.isBeingHovered,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final IconData icon;
  final Color? iconColor;
  final bool isSelected;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Padding(
        padding: themeSettings.tabIconPadding,
        child: Icon(
          icon,
          size: themeSettings.tabIconSize,
          color: iconColor,
        ),
      );
    }
    
    return AnimatedOpacity(
      duration: themeSettings.unselectedTabOpacityChangeDuration,
      opacity: isBeingHovered ? themeSettings.unselectedHoveredTabOpacity : themeSettings.unselectedNotHoveredTabOpacity,
      child: Padding(
        padding: themeSettings.tabIconPadding,
        child: Icon(
          icon,
          size: themeSettings.tabIconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
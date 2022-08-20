import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class TabText extends StatelessWidget {
  const TabText({
    Key? key,
    required this.themeSettings,
    required this.widgetName,
    required this.isSelected,
    required this.isBeingHovered,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String widgetName;
  final bool isSelected;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Center(
        child: Text(
          widgetName,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: themeSettings.tabTextStyle,
        )
      );
    }
    
    return Center(
      child: AnimatedOpacity(
        duration: themeSettings.unselectedTabOpacityChangeDuration,
        opacity: isBeingHovered ? themeSettings.unselectedHoveredTabOpacity : themeSettings.unselectedNotHoveredTabOpacity,
        child: Text(
          widgetName,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: themeSettings.tabTextStyle,
        ),
      )
    );
  }
}
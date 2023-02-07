import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.isFocused,
    required this.isBeingHovered,
  });

  final IconData icon;
  final Color? iconColor;
  final bool isFocused;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isFocused) {
      return Padding(
        padding: ManualWidgetTesterTheme.of(context).tabTheme.iconPadding,
        child: Icon(
          icon,
          size: ManualWidgetTesterTheme.of(context).tabTheme.iconSize,
          color: iconColor,
        ),
      );
    }

    return AnimatedOpacity(
      duration: ManualWidgetTesterTheme.of(context)
          .tabTheme
          .unfocusedTabOpacityChangeDuration,
      opacity: isBeingHovered
          ? ManualWidgetTesterTheme.of(context)
              .tabTheme
              .unfocusedHoveredTabOpacity
          : ManualWidgetTesterTheme.of(context)
              .tabTheme
              .unfocusedNotHoveredTabOpacity,
      child: Padding(
        padding: ManualWidgetTesterTheme.of(context).tabTheme.iconPadding,
        child: Icon(
          icon,
          size: ManualWidgetTesterTheme.of(context).tabTheme.iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}

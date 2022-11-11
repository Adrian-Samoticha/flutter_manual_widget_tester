import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'tab_background/tab_background.dart';
import 'tab_content/tab_content.dart';

class TabStack extends StatelessWidget {
  const TabStack(
      {Key? key,
      required this.isSelected,
      required this.themeSettings,
      required this.tabIndex,
      required this.selectedTabIndex,
      required this.icon,
      required this.iconColor,
      required this.widgetName,
      required this.isBeingHovered})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final int tabIndex;
  final int selectedTabIndex;
  final IconData? icon;
  final Color iconColor;
  final String widgetName;
  final bool isBeingHovered;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabBackground(
          themeSettings: themeSettings,
          tabIndex: tabIndex,
          selectedTabIndex: selectedTabIndex,
        ),
        TabContent(
          themeSettings: themeSettings,
          isBeingHovered: isBeingHovered,
          icon: icon,
          iconColor: iconColor,
          isSelected: isSelected,
          widgetName: widgetName,
        ),
      ],
    );
  }
}

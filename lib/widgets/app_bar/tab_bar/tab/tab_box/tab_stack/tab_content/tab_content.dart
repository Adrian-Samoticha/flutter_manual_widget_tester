import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'tab_icon.dart';
import 'tab_text.dart';

class TabContent extends StatelessWidget {
  const TabContent({
    Key? key,
    required this.themeSettings,
    required this.isBeingHovered,
    required this.icon,
    required this.iconColor,
    required this.isFocused,
    required this.widgetName,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final bool isBeingHovered;
  final IconData? icon;
  final Color? iconColor;
  final bool isFocused;
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.tabContentPadding,
      child: Row(
        children: [
          ...icon == null
              ? const []
              : [
                  TabIcon(
                    themeSettings: themeSettings,
                    icon: icon!,
                    iconColor: iconColor,
                    isFocused: isFocused,
                    isBeingHovered: isBeingHovered,
                  ),
                ],
          Expanded(
            child: TabText(
              themeSettings: themeSettings,
              widgetName: widgetName,
              isFocused: isFocused,
              isBeingHovered: isBeingHovered,
            ),
          ),
        ],
      ),
    );
  }
}

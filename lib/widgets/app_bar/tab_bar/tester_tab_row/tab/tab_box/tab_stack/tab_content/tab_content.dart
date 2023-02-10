import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'tab_icon.dart';
import 'tab_text.dart';

class TabContent extends StatelessWidget {
  const TabContent({
    super.key,
    required this.isBeingHovered,
    required this.icon,
    required this.iconColor,
    required this.isFocused,
    required this.widgetName,
  });

  final bool isBeingHovered;
  final IconData? icon;
  final Color? iconColor;
  final bool isFocused;
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context).tabTheme.contentPadding,
      child: Row(
        children: [
          ...icon == null
              ? const []
              : [
                  TabIcon(
                    icon: icon!,
                    iconColor: iconColor,
                    isFocused: isFocused,
                    isBeingHovered: isBeingHovered,
                  ),
                ],
          Expanded(
            child: TabText(
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

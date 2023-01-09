import 'package:flutter/material.dart';

import 'tab_background/tab_background.dart';
import 'tab_content/tab_content.dart';

class TabStack extends StatelessWidget {
  const TabStack(
      {Key? key,
      required this.isFocused,
      required this.tabIndex,
      required this.focusedTabIndex,
      required this.icon,
      required this.iconColor,
      required this.widgetName,
      required this.isBeingHovered})
      : super(key: key);

  final int tabIndex;
  final int focusedTabIndex;
  final IconData? icon;
  final Color iconColor;
  final String widgetName;
  final bool isBeingHovered;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabBackground(
          tabIndex: tabIndex,
          focusedTabIndex: focusedTabIndex,
        ),
        TabContent(
          isBeingHovered: isBeingHovered,
          icon: icon,
          iconColor: iconColor,
          isFocused: isFocused,
          widgetName: widgetName,
        ),
      ],
    );
  }
}

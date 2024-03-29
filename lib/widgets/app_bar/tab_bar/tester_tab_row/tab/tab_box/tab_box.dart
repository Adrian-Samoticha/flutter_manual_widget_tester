import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'tab_stack/tab_stack.dart';

class TabBox extends StatelessWidget {
  const TabBox({
    super.key,
    required this.width,
    required this.isBeingHovered,
    required this.isFocused,
    this.icon,
    required this.iconColor,
    required this.tabIndex,
    required this.focusedTabIndex,
    required this.widgetName,
  });

  final double width;
  final bool isBeingHovered;
  final bool isFocused;
  final IconData? icon;
  final Color iconColor;
  final int tabIndex;
  final int focusedTabIndex;
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration:
          ManualWidgetTesterTheme.of(context).tabTheme.openingAnimationDuration,
      tween: Tween<double>(begin: 1.0, end: 0.0),
      curve: ManualWidgetTesterTheme.of(context).tabTheme.openingAnimationCurve,
      builder: (BuildContext context, double value, Widget? child) {
        return FractionalTranslation(
          translation: Offset(0.0, value),
          child: child!,
        );
      },
      child: SizedBox(
        width: width,
        height: ManualWidgetTesterTheme.of(context).appBarTheme.height,
        child: Padding(
          padding: EdgeInsets.only(
            top: ManualWidgetTesterTheme.of(context).tabTheme.spaceAboveTabs,
          ),
          child: TabStack(
            isBeingHovered: isBeingHovered,
            isFocused: isFocused,
            icon: icon,
            iconColor: iconColor,
            focusedTabIndex: focusedTabIndex,
            tabIndex: tabIndex,
            widgetName: widgetName,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'tab_stack/tab_stack.dart';

class TabBox extends StatelessWidget {
  const TabBox({Key? key, required this.themeSettings, required this.width, required this.isBeingHovered, required this.isSelected, this.icon, required this.iconColor, required this.tabIndex, required this.selectedTabIndex, required this.widgetName}) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final double width;
  final bool isBeingHovered;
  final bool isSelected;
  final IconData? icon;
  final Color iconColor;
  final int tabIndex;
  final int selectedTabIndex;
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: themeSettings.tabOpenAnimationDuration,
      tween: Tween<double>(begin: 1.0, end: 0.0),
      curve: themeSettings.tabOpenAnimationCurve,
      builder: (BuildContext context, double value, Widget? child) {
        return ClipRect(
          child: FractionalTranslation(
            translation: Offset(0.0, value),
            child: child!,
          ),
        );
      },
      child: SizedBox(
        width: width,
        height: themeSettings.appBarHeight,
        child: Padding(
          padding: EdgeInsets.only(top: themeSettings.spaceAboveTabs),
          child: TabStack(
            isBeingHovered: isBeingHovered,
            isSelected: isSelected,
            icon: icon,
            iconColor: iconColor,
            selectedTabIndex: selectedTabIndex,
            tabIndex: tabIndex,
            themeSettings: themeSettings,
            widgetName: widgetName,
          ),
        ),
      ),
    );
  }
}
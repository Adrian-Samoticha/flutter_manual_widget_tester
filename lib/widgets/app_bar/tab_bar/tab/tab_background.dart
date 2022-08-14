import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class TabBackground extends StatelessWidget {
  const TabBackground({
    Key? key,
    required this.themeSettings,
    required this.tabIndex,
    required this.selectedTabIndex,
  }) : super(key: key);

  final int tabIndex;
  final int selectedTabIndex;
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    final isSelected = tabIndex == selectedTabIndex;
    
    return Stack(
      children: [
        Container(
          decoration: isSelected ? themeSettings.selectedTabBoxDecoration : themeSettings.unselectedTabBoxDecoration,
        ),
        !isSelected ? const SizedBox() : Container(
          width: themeSettings.selectedTabAccentColorDecorationWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(themeSettings.selectedTabAccentColorDecorationWidth),
              bottomRight: Radius.circular(themeSettings.selectedTabAccentColorDecorationWidth),
            ),
            color: themeSettings.accentColor,
          ),
        ),
        isSelected || tabIndex == selectedTabIndex - 1 ? const SizedBox() : Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 1.0,
            decoration: themeSettings.tabSeparatorBoxDecoration,
          ),
        ),
        Container(
          decoration: !isSelected ? null : themeSettings.tabLightReflectionBoxDecoration,
        ),
      ],
    );
  }
}
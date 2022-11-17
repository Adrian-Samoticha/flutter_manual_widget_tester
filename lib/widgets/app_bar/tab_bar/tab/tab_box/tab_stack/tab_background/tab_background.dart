import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'selected_tab_decoration.dart';
import 'tab_light_reflection.dart';
import 'tab_separator.dart';

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

    final tabDecoration = isSelected
        ? themeSettings.selectedTabBoxDecoration
        : themeSettings.unselectedTabBoxDecoration;

    return Stack(
      children: [
        Container(
          decoration: tabDecoration,
        ),
        ...!isSelected
            ? const []
            : [SelectedTabDecoration(themeSettings: themeSettings)],
        ...isSelected || tabIndex == selectedTabIndex - 1
            ? const []
            : [_buildRightAlignedTabSeparator()],
        TabLightReflection(
          isSelected: isSelected,
          themeSettings: themeSettings,
        ),
      ],
    );
  }

  Align _buildRightAlignedTabSeparator() {
    return Align(
      alignment: Alignment.centerRight,
      child: TabSeparator(
        themeSettings: themeSettings,
      ),
    );
  }
}

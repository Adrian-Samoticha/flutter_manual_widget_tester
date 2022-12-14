import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'focused_tab_decoration.dart';
import 'tab_light_reflection.dart';
import 'tab_separator.dart';

class TabBackground extends StatelessWidget {
  const TabBackground({
    Key? key,
    required this.themeSettings,
    required this.tabIndex,
    required this.focusedTabIndex,
  }) : super(key: key);

  final int tabIndex;
  final int focusedTabIndex;
  final ManualWidgetTesterThemeSettings themeSettings;

  bool get _isFocused => tabIndex == focusedTabIndex;

  @override
  Widget build(BuildContext context) {
    final tabDecoration = _isFocused
        ? themeSettings.focusedTabBoxDecoration
        : themeSettings.unfocusedTabBoxDecoration;

    return Stack(
      children: [
        Container(
          decoration: tabDecoration,
        ),
        ...!_isFocused
            ? const []
            : [FocusedTabDecoration(themeSettings: themeSettings)],
        ..._isFocused || tabIndex == focusedTabIndex - 1
            ? const []
            : [_buildRightAlignedTabSeparator()],
        TabLightReflection(
          isFocused: _isFocused,
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

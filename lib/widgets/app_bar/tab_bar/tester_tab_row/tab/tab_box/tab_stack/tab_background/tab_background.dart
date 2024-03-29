import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'focused_tab_decoration.dart';
import 'tab_light_reflection.dart';
import 'tab_separator.dart';

class TabBackground extends StatelessWidget {
  const TabBackground({
    super.key,
    required this.tabIndex,
    required this.focusedTabIndex,
  });

  final int tabIndex;
  final int focusedTabIndex;

  bool get _isFocused => tabIndex == focusedTabIndex;

  @override
  Widget build(BuildContext context) {
    final tabDecoration = _isFocused
        ? ManualWidgetTesterTheme.of(context).tabTheme.focusedTabBoxDecoration
        : ManualWidgetTesterTheme.of(context)
            .tabTheme
            .unfocusedTabBoxDecoration;

    return Stack(
      children: [
        Container(
          decoration: tabDecoration,
        ),
        ...!_isFocused ? const [] : const [FocusedTabDecoration()],
        ..._isFocused || tabIndex == focusedTabIndex - 1
            ? const []
            : const [_RightAlignedTabSeparator()],
        TabLightReflection(
          isFocused: _isFocused,
        ),
      ],
    );
  }
}

class _RightAlignedTabSeparator extends StatelessWidget {
  const _RightAlignedTabSeparator();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: TabSeparator(),
    );
  }
}

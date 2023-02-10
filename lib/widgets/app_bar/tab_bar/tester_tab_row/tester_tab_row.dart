import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'tab/tab.dart';

class TesterTabRow extends StatelessWidget {
  const TesterTabRow({super.key, required this.widgetTestSessionHandler});

  final WidgetTestSessionHandler widgetTestSessionHandler;

  double _calculateTabWidth(
    BuildContext context,
    int numberOfTabs,
    double maxWidth,
  ) {
    final minTabWidth = ManualWidgetTesterTheme.of(context).tabTheme.minWidth;
    final maxTabWidth = ManualWidgetTesterTheme.of(context).tabTheme.maxWidth;

    return (maxWidth / numberOfTabs).clamp(minTabWidth, maxTabWidth);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                widgetTestSessionHandler.widgetTestSessions.asMap().entries.map(
              (MapEntry<int, WidgetTestSession> entry) {
                final tabWidth = _calculateTabWidth(
                  context,
                  widgetTestSessionHandler.widgetTestSessions.length,
                  constraints.maxWidth,
                );
                final session = entry.value;

                return ManualWidgetTesterTab(
                  width: tabWidth,
                  widgetName: session.name,
                  tabIndex: entry.key,
                  focusedTabIndex: widgetTestSessionHandler.currentIndex,
                  onSelect: () =>
                      widgetTestSessionHandler.currentIndex = entry.key,
                  onClose: () => widgetTestSessionHandler
                      .closeWidgetTestSession(entry.key),
                  icon: session.icon,
                  iconColor: session.iconColor ??
                      ManualWidgetTesterTheme.of(context)
                          .iconTheme
                          .defaultColor,
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}

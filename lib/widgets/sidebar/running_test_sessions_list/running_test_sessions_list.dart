import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

import 'test_session_menu_item/test_session_menu_item.dart';

class RunningTestSessionsList extends StatelessWidget {
  const RunningTestSessionsList(
      {Key? key,
      required this.themeSettings,
      required this.widgetTestSessionHandler})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      heading: 'RUNNING TEST SESSIONS',
      themeSettings: themeSettings,
      child: Column(
        children: _generateTestSessionColumnChildren(),
      ),
    );
  }

  List<Widget> _generateTestSessionColumnChildren() {
    final enableIcons = widgetTestSessionHandler.widgetTestSessions
        .where((element) => element.icon != null)
        .isNotEmpty;

    return widgetTestSessionHandler.widgetTestSessions
        .asMap()
        .map((int index, WidgetTestSession session) {
          final toBeReturnedWidget = ManualWidgetTesterTestSessionMenuItem(
            widgetName: session.name,
            iconColor: session.iconColor ?? themeSettings.defaultIconColor,
            icon: session.icon,
            themeSettings: themeSettings,
            onSelect: () {
              widgetTestSessionHandler.currentIndex = index;
            },
            onClose: () {
              widgetTestSessionHandler.closeWidgetTestSession(index);
            },
            tabIndex: index,
            selectedTabIndex: widgetTestSessionHandler.currentIndex,
            enableIcon: enableIcons,
          );

          return MapEntry(index, toBeReturnedWidget);
        })
        .values
        .toList();
  }
}

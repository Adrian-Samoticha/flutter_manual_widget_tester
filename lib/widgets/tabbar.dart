import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/tab.dart';

class ManualWidgetTesterTabbar extends StatefulWidget {
  const ManualWidgetTesterTabbar({Key? key, required this.themeSettings, required this.widgetTestSessionHandler}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  State<ManualWidgetTesterTabbar> createState() => _ManualWidgetTesterTabbarState();
}

class _ManualWidgetTesterTabbarState extends State<ManualWidgetTesterTabbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.widgetTestSessionHandler.widgetTestSessions.asMap().entries.map((MapEntry<int, WidgetTestSession> entry) {
            return ManualWidgetTesterTab(
              width: 192.0,
              widgetName: entry.value.name,
              themeSettings: widget.themeSettings,
              tabIndex: entry.key,
              selectedTabIndex: widget.widgetTestSessionHandler.currentIndex,
              onSelect: () => setState(() {
                widget.widgetTestSessionHandler.currentIndex = entry.key;
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}
import 'dart:async';

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
  late StreamSubscription<WidgetTestSessionHandler> _widgetTestSessionsChangedStream;
  
  @override
  void initState() {
    _widgetTestSessionsChangedStream = widget.widgetTestSessionHandler.registerOnChangedCallback((_) {
      setState(() {});
    });
    
    super.initState();
  }
  
  @override
  void dispose() {
    _widgetTestSessionsChangedStream.cancel();
    
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.widgetTestSessionHandler.widgetTestSessions.asMap().entries.map((MapEntry<int, WidgetTestSession> entry) {
                final tabWidth = _calculateTabWidth(widget.widgetTestSessionHandler.widgetTestSessions.length, constraints.maxWidth);
                final session = entry.value;
                
                return ManualWidgetTesterTab(
                  width: tabWidth,
                  widgetName: session.name,
                  themeSettings: widget.themeSettings,
                  tabIndex: entry.key,
                  selectedTabIndex: widget.widgetTestSessionHandler.currentIndex,
                  onSelect: () => widget.widgetTestSessionHandler.currentIndex = entry.key,
                  onClose: () => widget.widgetTestSessionHandler.closeWidgetTestSession(entry.key),
                  icon: session.icon,
                  iconColor: session.iconColor ?? widget.themeSettings.defaultIconColor,
                );
              }).toList(),
            ),
          );
        }
      ),
    );
  }
  
  double _calculateTabWidth(int numberOfTabs, double maxWidth) {
    final minTabWidth = widget.themeSettings.minTabWidth;
    final maxTabWidth = widget.themeSettings.maxTabWidth;
    
    return (maxWidth / numberOfTabs).clamp(minTabWidth, maxTabWidth);
  }
}
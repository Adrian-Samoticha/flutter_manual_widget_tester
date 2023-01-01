import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';

import 'widget_test_session_area/widget_test_session_area.dart';

class ManualWidgetTesterWidgetTestSessionAreaStack extends StatefulWidget {
  final WidgetTestSessionHandler widgetTestSessionHandler;
  final MouseCursorOverrider mouseCursorOverrider;
  final ManualWidgetTesterThemeSettings themeSettings;

  const ManualWidgetTesterWidgetTestSessionAreaStack(
      {Key? key,
      required this.widgetTestSessionHandler,
      required this.mouseCursorOverrider,
      required this.themeSettings})
      : super(key: key);

  @override
  State<ManualWidgetTesterWidgetTestSessionAreaStack> createState() =>
      _ManualWidgetTesterWidgetTestSessionAreaStackState();
}

class _ManualWidgetTesterWidgetTestSessionAreaStackState
    extends State<ManualWidgetTesterWidgetTestSessionAreaStack> {
  late StreamSubscription _widgetTestSessionHandlerChangeStream;

  @override
  void initState() {
    _widgetTestSessionHandlerChangeStream =
        widget.widgetTestSessionHandler.registerOnChangedCallback((_) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _widgetTestSessionHandlerChangeStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.widgetTestSessionHandler.currentIndex,
      children: widget.widgetTestSessionHandler.widgetTestSessions
          .map((WidgetTestSession session) {
        return ManualWidgetTesterWidgetTestSessionArea(
          key: session.key,
          widgetTestSession: session,
          mouseCursorOverrider: widget.mouseCursorOverrider,
          themeSettings: widget.themeSettings,
        );
      }).toList(),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';

import 'widget_test_session_area/widget_test_session_area.dart';

class ManualWidgetTesterWidgetTestSessionAreaStack extends StatefulWidget {
  const ManualWidgetTesterWidgetTestSessionAreaStack({
    super.key,
    required this.widgetTestSessionHandler,
  });

  final WidgetTestSessionHandler widgetTestSessionHandler;

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
        );
      }).toList(),
    );
  }
}

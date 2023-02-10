import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';

import 'tester_tab_row/tester_tab_row.dart';

class ManualWidgetTesterTabBar extends StatefulWidget {
  const ManualWidgetTesterTabBar({
    super.key,
    required this.widgetTestSessionHandler,
  });

  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  State<ManualWidgetTesterTabBar> createState() =>
      _ManualWidgetTesterTabBarState();
}

class _ManualWidgetTesterTabBarState extends State<ManualWidgetTesterTabBar> {
  late StreamSubscription<WidgetTestSessionHandler>
      _widgetTestSessionsChangedStream;

  @override
  void initState() {
    _widgetTestSessionsChangedStream =
        widget.widgetTestSessionHandler.registerOnChangedCallback((_) {
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
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) {
          if (event.scrollDelta.dy == 0) {
            return;
          }

          setState(() {
            widget.widgetTestSessionHandler.currentIndex +=
                event.scrollDelta.dy > 0 ? 1 : -1;
          });
        }
      },
      child: ClipRect(
        child: SizedBox.expand(
          child: TesterTabRow(
            widgetTestSessionHandler: widget.widgetTestSessionHandler,
          ),
        ),
      ),
    );
  }
}

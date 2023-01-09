import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

import 'tab/tab.dart';

class ManualWidgetTesterTabBar extends StatefulWidget {
  const ManualWidgetTesterTabBar(
      {Key? key, required this.widgetTestSessionHandler})
      : super(key: key);

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
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getTesterTabListFromWidgetTestSessionHandler(
                    widget.widgetTestSessionHandler,
                    constraints,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<ManualWidgetTesterTab> _getTesterTabListFromWidgetTestSessionHandler(
      WidgetTestSessionHandler widgetTestSessionHandler,
      BoxConstraints constraints) {
    return widgetTestSessionHandler.widgetTestSessions.asMap().entries.map(
      (MapEntry<int, WidgetTestSession> entry) {
        final tabWidth = _calculateTabWidth(
            widgetTestSessionHandler.widgetTestSessions.length,
            constraints.maxWidth);
        final session = entry.value;

        return ManualWidgetTesterTab(
          width: tabWidth,
          widgetName: session.name,
          tabIndex: entry.key,
          focusedTabIndex: widgetTestSessionHandler.currentIndex,
          onSelect: () =>
              widget.widgetTestSessionHandler.currentIndex = entry.key,
          onClose: () =>
              widgetTestSessionHandler.closeWidgetTestSession(entry.key),
          icon: session.icon,
          iconColor: session.iconColor ??
              ManualWidgetTesterTheme.of(context).iconTheme.defaultIconColor,
        );
      },
    ).toList();
  }

  double _calculateTabWidth(int numberOfTabs, double maxWidth) {
    final minTabWidth =
        ManualWidgetTesterTheme.of(context).tabTheme.minTabWidth;
    final maxTabWidth =
        ManualWidgetTesterTheme.of(context).tabTheme.maxTabWidth;

    return (maxWidth / numberOfTabs).clamp(minTabWidth, maxTabWidth);
  }
}

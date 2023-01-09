import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'app_bar_shadow.dart';
import 'new_test_session_button.dart';
import 'tab_bar/tab_bar.dart';

class ManualWidgetTesterAppBar extends StatefulWidget {
  const ManualWidgetTesterAppBar(
      {Key? key,
      required this.widgetTestSessionHandler,
      required this.builders})
      : super(key: key);

  final WidgetTestSessionHandler widgetTestSessionHandler;
  final List<WidgetTestBuilder> builders;

  @override
  State<ManualWidgetTesterAppBar> createState() =>
      _ManualWidgetTesterAppBarState();
}

class _ManualWidgetTesterAppBarState extends State<ManualWidgetTesterAppBar> {
  late double _appBarShadowOpacity;
  late StreamSubscription<WidgetTestSessionHandler>
      _widgetTestSessionHandlerOnChangedCallbackStreamSubscription;

  @override
  void initState() {
    _appBarShadowOpacity =
        widget.widgetTestSessionHandler.widgetTestSessions.isEmpty ? 0.0 : 1.0;

    _widgetTestSessionHandlerOnChangedCallbackStreamSubscription =
        widget.widgetTestSessionHandler.registerOnChangedCallback(
      (WidgetTestSessionHandler sessionHandler) {
        setState(
          () {
            _appBarShadowOpacity =
                sessionHandler.widgetTestSessions.isEmpty ? 0.0 : 1.0;
          },
        );
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _widgetTestSessionHandlerOnChangedCallbackStreamSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManualWidgetTesterTheme.of(context).appBarTheme.appBarHeight,
      color: ManualWidgetTesterTheme.of(context).generalTheme.sidebarColor,
      child: Stack(
        children: [
          AnimatedOpacity(
            duration: ManualWidgetTesterTheme.of(context)
                .tabTheme
                .tabOpenAnimationDuration,
            opacity: _appBarShadowOpacity,
            child: AppBarShadow(),
          ),
          Row(
            children: [
              Expanded(
                child: ManualWidgetTesterTabBar(
                  widgetTestSessionHandler: widget.widgetTestSessionHandler,
                ),
              ),
              Container(
                width: ManualWidgetTesterTheme.of(context)
                    .appBarTheme
                    .appBarHeight,
                padding: ManualWidgetTesterTheme.of(context)
                    .createTestSessionButtonTheme
                    .createTestSessionButtonPadding,
                child: NewTestSessionButton(
                  builders: widget.builders,
                  widgetTestSessionHandler: widget.widgetTestSessionHandler,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

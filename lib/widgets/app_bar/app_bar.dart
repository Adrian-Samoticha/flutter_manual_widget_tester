import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'app_bar_shadow.dart';
import 'new_test_session_button.dart';
import 'tab_bar/tab_bar.dart';

class ManualWidgetTesterAppBar extends StatefulWidget {
  const ManualWidgetTesterAppBar(
      {Key? key,
      required this.themeSettings,
      required this.widgetTestSessionHandler,
      required this.builders})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
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
      height: widget.themeSettings.appBarHeight,
      color: widget.themeSettings.sidebarColor,
      child: Stack(
        children: [
          AnimatedOpacity(
            duration: widget.themeSettings.tabOpenAnimationDuration,
            opacity: _appBarShadowOpacity,
            child: AppBarShadow(themeSettings: widget.themeSettings),
          ),
          Row(
            children: [
              Expanded(
                child: ManualWidgetTesterTabBar(
                  themeSettings: widget.themeSettings,
                  widgetTestSessionHandler: widget.widgetTestSessionHandler,
                ),
              ),
              Container(
                width: widget.themeSettings.appBarHeight,
                padding: widget.themeSettings.createTestSessionButtonPadding,
                child: NewTestSessionButton(
                  themeSettings: widget.themeSettings,
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

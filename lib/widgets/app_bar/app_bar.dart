import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'app_bar_shadow.dart';
import 'new_test_session_button.dart';
import 'tab_bar/tab_bar.dart';

class ManualWidgetTesterAppBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      height: themeSettings.appBarHeight,
      color: themeSettings.sidebarColor,
      child: Stack(
        children: [
          AppBarShadow(themeSettings: themeSettings),
          Row(
            children: [
              Expanded(
                child: ManualWidgetTesterTabBar(
                  themeSettings: themeSettings,
                  widgetTestSessionHandler: widgetTestSessionHandler,
                ),
              ),
              Container(
                width: themeSettings.appBarHeight,
                padding: themeSettings.createTestSessionButtonPadding,
                child: NewTestSessionButton(
                  themeSettings: themeSettings,
                  builders: builders,
                  widgetTestSessionHandler: widgetTestSessionHandler,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


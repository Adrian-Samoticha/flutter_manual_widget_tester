import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/tab_bar.dart';

class ManualWidgetTesterAppBar extends StatelessWidget {
  const ManualWidgetTesterAppBar({Key? key, required this.themeSettings, required this.widgetTestSessionHandler}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: themeSettings.appBarHeight,
      color: themeSettings.sidebarColor,
      child: ManualWidgetTesterTabBar(
        themeSettings: themeSettings,
        widgetTestSessionHandler: widgetTestSessionHandler,
      ),
    );
  }
}
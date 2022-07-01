import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/tabbar.dart';

class ManualWidgetTesterAppbar extends StatelessWidget {
  const ManualWidgetTesterAppbar({Key? key, required this.themeSettings, required this.widgetTestSessionHandler}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: themeSettings.appbarHeight,
      color: themeSettings.sidebarColor,
      child: ManualWidgetTesterTabbar(
        themeSettings: themeSettings,
        widgetTestSessionHandler: widgetTestSessionHandler,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/tab.dart';

class ManualWidgetTesterTabbar extends StatelessWidget {
  const ManualWidgetTesterTabbar({Key? key, required this.themeSettings}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    const selectedTabIndex = 1;
    
    return SizedBox.expand(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ManualWidgetTesterTab(
              width: 192.0,
              tabIndex: 0,
              selectedTabIndex: selectedTabIndex,
              widgetName: 'ThemeSettings',
              themeSettings: themeSettings,
            ),
            ManualWidgetTesterTab(
              width: 192.0,
              tabIndex: 1,
              selectedTabIndex: selectedTabIndex,
              widgetName: 'MouseCursorOverrider',
              themeSettings: themeSettings,
            ),
            ManualWidgetTesterTab(
              width: 192.0,
              tabIndex: 2,
              selectedTabIndex: selectedTabIndex,
              widgetName: 'MouseCursorOverriderTestWidget',
              themeSettings: themeSettings,
            ),
          ],
        ),
      ),
    );
  }
}
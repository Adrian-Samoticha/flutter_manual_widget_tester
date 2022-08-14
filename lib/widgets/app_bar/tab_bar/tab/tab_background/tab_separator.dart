import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class TabSeparator extends StatelessWidget {
  const TabSeparator({
    Key? key,
    required this.themeSettings,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      decoration: themeSettings.tabSeparatorBoxDecoration,
    );
  }
}
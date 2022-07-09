import 'package:flutter/widgets.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_custom_settings.dart';

class WidgetTestSession {
  WidgetTestSession({required this.builder, this.name = 'unnamed', this.icon, this.iconColor}) : key = UniqueKey(),
    assert(iconColor == null || icon != null, 'iconColor must be null if icon is null.');
  
  final Key key;
  final Widget Function(BuildContext, WidgetTestSessionCustomSettings) builder;
  final String name;
  final IconData? icon;
  final Color? iconColor;
  final WidgetTestSessionCustomSettings customSettings = WidgetTestSessionCustomSettings();
}
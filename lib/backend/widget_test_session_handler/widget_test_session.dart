import 'package:flutter/widgets.dart';

import 'widget_test_builder.dart';
import 'widget_test_session_custom_settings.dart';

class WidgetTestSession {
  WidgetTestSession(this.widgetTestBuilder) : key = UniqueKey(), customSettings = WidgetTestSessionCustomSettings();
  
  WidgetTestSession.withKeyAndCustomSettings(this.widgetTestBuilder, this.key, this.customSettings);
  
  final Key key;
  final WidgetTestBuilder widgetTestBuilder;
  final WidgetTestSessionCustomSettings customSettings;
  
  Widget Function(BuildContext, WidgetTestSessionCustomSettings) get builder => widgetTestBuilder.builder;
  String get name => widgetTestBuilder.name;
  IconData? get icon => widgetTestBuilder.icon;
  Color? get iconColor => widgetTestBuilder.iconColor;
}
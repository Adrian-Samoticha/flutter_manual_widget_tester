import 'package:flutter/widgets.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_generic_settings.dart';

import 'widget_test_builder.dart';
import 'widget_test_session_custom_settings.dart';

class WidgetTestSession {
  WidgetTestSession(this.widgetTestBuilder)
      : key = UniqueKey(),
        customSettings = WidgetTestSessionCustomSettings(),
        genericSettings = WidgetTestSessionGenericSettings();

  WidgetTestSession.withKeyAndSettings(this.widgetTestBuilder, this.key,
      this.customSettings, this.genericSettings);

  WidgetTestSession recreateWithNewWidgetTestBuilder(
      WidgetTestBuilder widgetTestBuilder) {
    return WidgetTestSession.withKeyAndSettings(
        widgetTestBuilder, key, customSettings, genericSettings);
  }

  final Key key;
  final WidgetTestBuilder widgetTestBuilder;
  final WidgetTestSessionCustomSettings customSettings;
  final WidgetTestSessionGenericSettings genericSettings;

  Widget Function(BuildContext, WidgetTestSessionCustomSettings) get builder =>
      widgetTestBuilder.builder;
  String get name => widgetTestBuilder.name;
  IconData? get icon => widgetTestBuilder.icon;
  Color? get iconColor => widgetTestBuilder.iconColor;
}

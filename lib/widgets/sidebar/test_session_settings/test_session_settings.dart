import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

import 'custom_settings.dart';
import 'generic_settings/generic_settings.dart';

class TestSessionSettings extends StatelessWidget {
  const TestSessionSettings(
      {Key? key,
      required this.themeSettings,
      required this.config,
      required this.typeEditorBuilder,
      required this.widgetTestSessionHandler})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final ManualWidgetTesterConfig config;
  final TypeEditorBuilder typeEditorBuilder;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      heading: '${_getCurrentTestSessionNameFormatted()} SETTINGS',
      themeSettings: themeSettings,
      child: IndexedStack(
        index: widgetTestSessionHandler.currentIndex,
        children: widgetTestSessionHandler.widgetTestSessions
            .map((WidgetTestSession session) {
          return Column(
            children: [
              CustomSettings(
                themeSettings: themeSettings,
                typeEditorBuilder: typeEditorBuilder,
                session: session,
              ),
              GenericSettings(
                themeSettings: themeSettings,
                session: session,
                config: config,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  String _getCurrentTestSessionNameFormatted() {
    final currentName = _getCurrentTestSessionName();
    return StringUtils.camelCaseToUpperUnderscore(currentName)
        .replaceAll('_', ' ')
        .replaceAll('.', '')
        .replaceAll('  ', ' ')
        .trim();
  }

  String _getCurrentTestSessionName() {
    final sessionHandler = widgetTestSessionHandler;
    return sessionHandler.widgetTestSessions[sessionHandler.currentIndex].name;
  }
}

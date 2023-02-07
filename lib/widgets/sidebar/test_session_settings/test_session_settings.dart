import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

import 'custom_settings.dart';
import 'generic_settings/generic_settings.dart';

class TestSessionSettings extends StatelessWidget {
  const TestSessionSettings({
    super.key,
    required this.typeEditorBuilder,
    required this.widgetTestSessionHandler,
  });

  final TypeEditorBuilder typeEditorBuilder;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      heading: '${_getCurrentTestSessionNameFormatted()} SETTINGS',
      child: IndexedStack(
        index: widgetTestSessionHandler.currentIndex,
        children: widgetTestSessionHandler.widgetTestSessions
            .map((WidgetTestSession session) {
          return Column(
            children: [
              CustomSettings(
                typeEditorBuilder: typeEditorBuilder,
                session: session,
              ),
              GenericSettings(
                session: session,
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

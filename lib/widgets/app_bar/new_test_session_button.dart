import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/create_test_session_dialog_generator/create_test_session_dialog_generator.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';

class NewTestSessionButton extends StatelessWidget {
  const NewTestSessionButton({
    Key? key,
    required this.themeSettings,
    required this.builders,
    required this.widgetTestSessionHandler,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final List<WidgetTestBuilder> builders;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterButtonRow(
      themeSettings: themeSettings,
      buttons: [
        ManualWidgetTesterButtonInfo(
          onButtonDown: null,
          onButtonPressed: () {
            CreateTestSessionDialogGenerator.showNewTestSessionDialog(
              context: context,
              themeSettings: themeSettings,
              builders: builders,
              widgetTestSessionHandler: widgetTestSessionHandler,
            );
          },
          child: const Center(child: Icon(Icons.add)),
        ),
      ],
    );
  }
}

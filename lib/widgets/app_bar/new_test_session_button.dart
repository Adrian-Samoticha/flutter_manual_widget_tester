import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/widgets/create_test_session_dialog_generator/create_test_session_dialog_generator.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';

class NewTestSessionButton extends StatelessWidget {
  const NewTestSessionButton({
    super.key,
    required this.builders,
    required this.widgetTestSessionHandler,
  });

  final List<WidgetTestBuilder> builders;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterButtonRow(
      buttons: [
        ManualWidgetTesterButtonInfo(
          onButtonDown: null,
          onButtonPressed: () {
            CreateTestSessionDialogGenerator.showNewTestSessionDialog(
              context: context,
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

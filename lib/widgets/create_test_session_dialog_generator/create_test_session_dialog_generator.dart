import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'create_test_session_dialog/create_test_session_dialog.dart';

class CreateTestSessionDialogGenerator {
  static void showNewTestSessionDialog({
    required BuildContext context,
    required List<WidgetTestBuilder> builders,
    required WidgetTestSessionHandler widgetTestSessionHandler,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor:
          ManualWidgetTesterTheme.of(context).dialogTheme.dialogBarrierColor,
      transitionDuration: const Duration(milliseconds: 0),
      pageBuilder: (BuildContext _, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return ManualWidgetTesterTheme(
          themeSettings: ManualWidgetTesterTheme.of(context),
          child: Align(
            alignment: Alignment.topCenter,
            child: CreateTestSessionDialog(
              builders: builders,
              widgetTestSessionHandler: widgetTestSessionHandler,
            ),
          ),
        );
      },
    );
  }
}

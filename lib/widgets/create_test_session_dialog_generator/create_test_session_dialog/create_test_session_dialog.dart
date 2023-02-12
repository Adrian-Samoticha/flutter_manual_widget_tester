import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'main_column/main_column.dart';

class CreateTestSessionDialog extends StatefulWidget {
  const CreateTestSessionDialog({
    super.key,
    required this.builders,
    required this.widgetTestSessionHandler,
  });

  final List<WidgetTestBuilder> builders;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  State<CreateTestSessionDialog> createState() =>
      _CreateTestSessionDialogState();
}

class _CreateTestSessionDialogState extends State<CreateTestSessionDialog> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ManualWidgetTesterTheme.of(context).generalTheme.isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: ManualWidgetTesterTheme.of(context).dialogTheme.shadow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: ManualWidgetTesterTheme.of(context)
                .dialogTheme
                .borderRadius
                .bottomLeft,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX:
                  ManualWidgetTesterTheme.of(context).dialogTheme.blurRadius,
              sigmaY:
                  ManualWidgetTesterTheme.of(context).dialogTheme.blurRadius,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: ManualWidgetTesterTheme.of(context)
                      .dialogTheme
                      .borderRadius
                      .bottomLeft,
                ),
                color: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .backgroundColor,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: ManualWidgetTesterTheme.of(context)
                        .dialogTheme
                        .borderColor,
                  ),
                ),
              ),
              width: ManualWidgetTesterTheme.of(context)
                  .createTestSessionDialogTheme
                  .width,
              padding: ManualWidgetTesterTheme.of(context)
                  .createTestSessionDialogTheme
                  .padding,
              child: MainColumn(
                builders: widget.builders,
                widgetTestSessionHandler: widget.widgetTestSessionHandler,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

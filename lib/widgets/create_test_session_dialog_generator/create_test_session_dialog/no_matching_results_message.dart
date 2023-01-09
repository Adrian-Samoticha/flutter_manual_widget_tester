import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';

class NoMatchingResultsMessage extends StatelessWidget {
  const NoMatchingResultsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context)
          .createTestSessionDialogTheme
          .createTestSessionDialogSearchResultsPadding,
      child: DefaultTextStyle(
        style: DefaultTextStyleProvider.defaultTextStyle,
        child: Text('No matching results.',
            style: ManualWidgetTesterTheme.of(context)
                .createTestSessionDialogTheme
                .createTestSessionDialogNoMatchingResultsTextStyle),
      ),
    );
  }
}

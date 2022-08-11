import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';


class NoMatchingResultsMessage extends StatelessWidget {
  const NoMatchingResultsMessage({
    Key? key,
    required this.themeSettings,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.createTestSessionDialogSearchResultsPadding,
      child: DefaultTextStyle(
        style: DefaultTextStyleProvider.defaultTextStyle,
        child: Text(
          'No matching results.',
          style: themeSettings.createTestSessionDialogNoMatchingResultsTextStyle
        ),
      ),
    );
  }
}
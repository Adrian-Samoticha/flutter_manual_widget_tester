import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import '../ui_elements/heading.dart';

class ManualWidgetTesterCustomSettingsStringEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsStringEditor(
      {Key? key,
      required this.settingName,
      required this.currentValue,
      required this.onChanged})
      : super(key: key);

  final String settingName;
  final String currentValue;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context).customSettingsTheme.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(
            settingName: settingName,
          ),
          SizedBox(
            height: ManualWidgetTesterTheme.of(context)
                .stringEditorTheme
                .stringEditorHeight,
            child: ManualWidgetTesterTextField(
              initialValue: currentValue,
              onSubmitted: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

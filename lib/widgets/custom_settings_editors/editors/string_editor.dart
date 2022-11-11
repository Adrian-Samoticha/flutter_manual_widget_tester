import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import '../ui_elements/heading.dart';

class ManualWidgetTesterCustomSettingsStringEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsStringEditor(
      {Key? key,
      required this.themeSettings,
      required this.settingName,
      required this.currentValue,
      required this.onChanged})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final String currentValue;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(
              themeSettings: themeSettings, settingName: settingName),
          SizedBox(
            height: themeSettings.stringEditorHeight,
            child: ManualWidgetTesterTextField(
              initialValue: currentValue,
              onSubmitted: onChanged,
              themeSettings: themeSettings,
            ),
          ),
        ],
      ),
    );
  }
}

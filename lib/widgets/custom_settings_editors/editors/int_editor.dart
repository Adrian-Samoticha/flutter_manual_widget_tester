import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import '../ui_elements/heading.dart';

class ManualWidgetTesterCustomSettingsIntEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsIntEditor({Key? key, required this.themeSettings, required this.settingName, required this.currentValue, required this.onChanged}) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final int currentValue;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(themeSettings: themeSettings, settingName: settingName),
          SizedBox(
            height: themeSettings.stringEditorHeight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    Expanded(
                      child: _generateTextField(),
                    ),
                    SizedBox(width: themeSettings.spaceBetweenTextBoxesAndButtonRows),
                    _generateButtonRow(constraints),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  ManualWidgetTesterTextField _generateTextField() {
    return ManualWidgetTesterTextField(
      initialValue: currentValue.toString(),
      onSubmitted: (String valueAsString) {
        final parsedValue = int.tryParse(valueAsString);
        onChanged(parsedValue ?? currentValue);
      },
      themeSettings: themeSettings,
      disableRoundedCornersOnRightSide: true,
    );
  }

  SizedBox _generateButtonRow(BoxConstraints constraints) {
    return SizedBox(
      width: min(themeSettings.defaultNumberEditorButtonRowWidth, constraints.maxWidth * 0.5),
      child: ManualWidgetTesterButtonRow(
        themeSettings: themeSettings,
        disableRoundedCornersOnLeftSide: true,
        buttons: [
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('-')),
            onButtonPressed: null,
            onButtonDown: () {
              onChanged(currentValue - 1);
            },
          ),
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('+')),
            onButtonPressed: null,
            onButtonDown: () {
              onChanged(currentValue + 1);
            },
          ),
        ],
      ),
    );
  }
}
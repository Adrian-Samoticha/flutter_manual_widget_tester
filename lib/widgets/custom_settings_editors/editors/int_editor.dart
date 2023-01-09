import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import '../ui_elements/heading.dart';

class ManualWidgetTesterCustomSettingsIntEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsIntEditor(
      {Key? key,
      required this.themeSettings,
      required this.settingName,
      required this.currentValue,
      required this.onChanged,
      this.lowerValue,
      this.upperValue,
      this.stepSize = 1})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final int currentValue;
  final void Function(int) onChanged;
  final int? lowerValue;
  final int? upperValue;
  final int stepSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsTheme.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(
              themeSettings: themeSettings, settingName: settingName),
          SizedBox(
            height: themeSettings.stringEditorTheme.stringEditorHeight,
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                children: [
                  Expanded(
                    child: _buildTextField(),
                  ),
                  SizedBox(
                      width: themeSettings
                          .generalTheme.spaceBetweenTextBoxesAndButtonRows),
                  _buildButtonRow(constraints),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  ManualWidgetTesterTextField _buildTextField() {
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

  SizedBox _buildButtonRow(BoxConstraints constraints) {
    return SizedBox(
      width: min(themeSettings.generalTheme.defaultNumberEditorButtonRowWidth,
          constraints.maxWidth * 0.5),
      child: ManualWidgetTesterButtonRow(
        themeSettings: themeSettings,
        disableRoundedCornersOnLeftSide: true,
        buttons: [
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('-')),
            onButtonPressed: null,
            onButtonDown: lowerValue == null || lowerValue! < currentValue
                ? () {
                    onChanged(currentValue - stepSize);
                  }
                : null,
          ),
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('+')),
            onButtonPressed: null,
            onButtonDown: upperValue == null || upperValue! > currentValue
                ? () {
                    onChanged(currentValue + stepSize);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

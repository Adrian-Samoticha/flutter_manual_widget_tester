import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import '../ui_elements/heading.dart';

class ManualWidgetTesterCustomSettingsIntEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsIntEditor({
    super.key,
    required this.settingName,
    required this.currentValue,
    required this.onChanged,
    this.lowerValue,
    this.upperValue,
    this.stepSize = 1,
  });

  final String settingName;
  final int currentValue;
  final void Function(int) onChanged;
  final int? lowerValue;
  final int? upperValue;
  final int stepSize;

  ManualWidgetTesterTextField _buildTextField() {
    return ManualWidgetTesterTextField(
      initialValue: currentValue.toString(),
      onSubmitted: (String valueAsString) {
        final parsedValue = int.tryParse(valueAsString);
        onChanged(parsedValue ?? currentValue);
      },
      disableRoundedCornersOnRightSide: true,
    );
  }

  SizedBox _buildButtonRow(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      width: min(
        ManualWidgetTesterTheme.of(context)
            .generalTheme
            .defaultNumberEditorButtonRowWidth,
        constraints.maxWidth * 0.5,
      ),
      child: ManualWidgetTesterButtonRow(
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
            height:
                ManualWidgetTesterTheme.of(context).stringEditorTheme.height,
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                children: [
                  Expanded(
                    child: _buildTextField(),
                  ),
                  SizedBox(
                    width: ManualWidgetTesterTheme.of(context)
                        .generalTheme
                        .spaceBetweenTextBoxesAndButtonRows,
                  ),
                  _buildButtonRow(context, constraints),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

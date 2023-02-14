import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import '../../ui_elements/heading.dart';
import 'button_row.dart';

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
                  ButtonRow(
                    constraints: constraints,
                    currentValue: currentValue,
                    onChanged: onChanged,
                    lowerValue: lowerValue,
                    upperValue: upperValue,
                    stepSize: stepSize,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

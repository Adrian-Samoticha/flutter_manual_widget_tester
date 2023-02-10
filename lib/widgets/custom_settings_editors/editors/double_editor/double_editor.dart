import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';
import 'package:sprintf/sprintf.dart';

import '../../ui_elements/heading.dart';
import 'themed_interactive_infinite_scroll_view/themed_interactive_infinite_scroll_view.dart';

class ManualWidgetTesterCustomSettingsDoubleEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsDoubleEditor({
    super.key,
    required this.settingName,
    required this.currentValue,
    required this.onChanged,
    this.lowerLimit = double.negativeInfinity,
    this.upperLimit = double.infinity,
  });

  static const double epsilon = 0.00000001;

  final String settingName;
  final double currentValue;
  final void Function(double) onChanged;
  final double lowerLimit;
  final double upperLimit;

  ManualWidgetTesterTextField _buildTextField() {
    return ManualWidgetTesterTextField(
      initialValue: sprintf('%f', [currentValue]),
      onSubmitted: (String valueAsString) {
        final parsedValue = double.tryParse(valueAsString);
        onChanged(parsedValue ?? currentValue);
      },
      disableRoundedCornersOnRightSide: true,
    );
  }

  bool _isDoubleSimilar(double double1, double double2) {
    final delta = (double1 - double2).abs();

    return delta < epsilon;
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
            onButtonDown: _isDoubleSimilar(currentValue, lowerLimit)
                ? null
                : () {
                    onChanged(currentValue - 0.2);
                  },
          ),
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('+')),
            onButtonPressed: null,
            onButtonDown: _isDoubleSimilar(currentValue, upperLimit)
                ? null
                : () {
                    onChanged(currentValue + 0.2);
                  },
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
          Column(
            children: [
              SizedBox(
                height: ManualWidgetTesterTheme.of(context)
                    .stringEditorTheme
                    .height,
                child: LayoutBuilder(
                  builder: (context, constraints) {
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
                  },
                ),
              ),
              SizedBox(
                height: ManualWidgetTesterTheme.of(context)
                    .doubleEditorTheme
                    .spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView,
              ),
              ThemedInteractiveInfiniteScrollView(
                currentValue: currentValue,
                onChanged: onChanged,
                lowerLimit: lowerLimit,
                upperLimit: upperLimit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

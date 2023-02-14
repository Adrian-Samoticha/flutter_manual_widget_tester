import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    super.key,
    required this.constraints,
    required this.currentValue,
    required this.onChanged,
    required this.lowerValue,
    required this.upperValue,
    required this.stepSize,
  });

  final BoxConstraints constraints;
  final int currentValue;
  final void Function(int) onChanged;
  final int? lowerValue;
  final int? upperValue;
  final int stepSize;

  @override
  Widget build(BuildContext context) {
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
}

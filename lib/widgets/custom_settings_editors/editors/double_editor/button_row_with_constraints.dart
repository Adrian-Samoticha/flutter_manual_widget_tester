import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';

class ButtonRowWithConstraints extends StatelessWidget {
  const ButtonRowWithConstraints({
    super.key,
    required this.constraints,
    required this.currentValue,
    required this.onChanged,
    required this.lowerLimit,
    required this.upperLimit,
  });

  static const double epsilon = 0.00000001;

  final BoxConstraints constraints;
  final double currentValue;
  final void Function(double) onChanged;
  final double lowerLimit;
  final double upperLimit;

  bool _isDoubleSimilar(double double1, double double2) {
    final delta = (double1 - double2).abs();

    return delta < epsilon;
  }

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
            onButtonDown: _isDoubleSimilar(currentValue, lowerLimit)
                ? null
                : () => onChanged(currentValue - 0.2),
          ),
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('+')),
            onButtonPressed: null,
            onButtonDown: _isDoubleSimilar(currentValue, upperLimit)
                ? null
                : () => onChanged(currentValue + 0.2),
          ),
        ],
      ),
    );
  }
}

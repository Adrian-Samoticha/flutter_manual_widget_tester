import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';
import 'package:sprintf/sprintf.dart';

class DoubleEditorTextField extends StatelessWidget {
  const DoubleEditorTextField({
    super.key,
    required this.currentValue,
    required this.onChanged,
  });

  final double currentValue;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterTextField(
      initialValue: sprintf('%f', [currentValue]),
      onSubmitted: (String valueAsString) {
        final parsedValue = double.tryParse(valueAsString);
        onChanged(parsedValue ?? currentValue);
      },
      disableRoundedCornersOnRightSide: true,
    );
  }
}

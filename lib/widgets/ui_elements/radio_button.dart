import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ManualWidgetTesterRadioButton extends StatelessWidget {
  const ManualWidgetTesterRadioButton({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return ManualWidgetTesterTheme.of(context)
          .radioButtonTheme
          .selectedRadioButton;
    }

    return ManualWidgetTesterTheme.of(context)
        .radioButtonTheme
        .unselectedRadioButton;
  }
}

class ManualWidgetTesterRadioButtonWithLabel extends StatelessWidget {
  const ManualWidgetTesterRadioButtonWithLabel({
    super.key,
    required this.isSelected,
    required this.label,
  });

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1.0,
            child: ManualWidgetTesterRadioButton(
              isSelected: isSelected,
            ),
          ),
        ),
        SizedBox(
          width: ManualWidgetTesterTheme.of(context)
              .radioButtonTheme
              .spaceBetweenRadioButtonAndLabel,
        ),
        Expanded(
          child: Text(
            label,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: isSelected
                ? ManualWidgetTesterTheme.of(context)
                    .radioButtonTheme
                    .selectedRadioButtonLabelStyle
                : ManualWidgetTesterTheme.of(context)
                    .radioButtonTheme
                    .unselectedRadioButtonLabelStyle,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ManualWidgetTesterRadioButton extends StatelessWidget {
  final bool isSelected;

  const ManualWidgetTesterRadioButton({Key? key, required this.isSelected})
      : super(key: key);

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
  final bool isSelected;
  final String label;

  const ManualWidgetTesterRadioButtonWithLabel(
      {Key? key, required this.isSelected, required this.label})
      : super(key: key);

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
                .spaceBetweenRadioButtonAndLabel),
        Expanded(
          child: Text(label,
              softWrap: false,
              overflow: TextOverflow.fade,
              style: isSelected
                  ? ManualWidgetTesterTheme.of(context)
                      .radioButtonTheme
                      .selectedRadioButtonLabelStyle
                  : ManualWidgetTesterTheme.of(context)
                      .radioButtonTheme
                      .unselectedRadioButtonLabelStyle),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class ManualWidgetTesterRadioButton extends StatelessWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final bool isSelected;

  const ManualWidgetTesterRadioButton(
      {Key? key, required this.isSelected, required this.themeSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return themeSettings.selectedRadioButton;
    }

    return themeSettings.unselectedRadioButton;
  }
}

class ManualWidgetTesterRadioButtonWithLabel extends StatelessWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final bool isSelected;
  final String label;

  const ManualWidgetTesterRadioButtonWithLabel(
      {Key? key,
      required this.themeSettings,
      required this.isSelected,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1.0,
            child: ManualWidgetTesterRadioButton(
              themeSettings: themeSettings,
              isSelected: isSelected,
            ),
          ),
        ),
        SizedBox(width: themeSettings.spaceBetweenRadioButtonAndLabel),
        Expanded(
          child: Text(label,
              softWrap: false,
              overflow: TextOverflow.fade,
              style: isSelected
                  ? themeSettings.selectedRadioButtonLabelStyle
                  : themeSettings.unselectedRadioButtonLabelStyle),
        ),
      ],
    );
  }
}

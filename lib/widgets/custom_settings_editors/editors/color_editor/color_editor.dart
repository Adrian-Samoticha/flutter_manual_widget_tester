import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import '../../ui_elements/heading.dart';
import 'color_picker/color_picker.dart';

class ManualWidgetTesterCustomSettingsColorEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsColorEditor({
    super.key,
    required this.settingName,
    required this.currentValue,
    required this.onChanged,
  });

  final String settingName;
  final Color currentValue;
  final void Function(Color) onChanged;

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
                ManualWidgetTesterTheme.of(context).editColorButtonTheme.height,
            child: ColorPicker(
              selectedColor: currentValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

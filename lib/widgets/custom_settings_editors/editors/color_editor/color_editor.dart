import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import '../../ui_elements/heading.dart';
import 'color_picker/color_picker.dart';

class ManualWidgetTesterCustomSettingsColorEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsColorEditor({Key? key, required this.themeSettings, required this.settingName, required this.currentValue, required this.onChanged}) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final Color currentValue;
  final void Function(Color) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(themeSettings: themeSettings, settingName: settingName),
          SizedBox(
            height: themeSettings.editColorButtonHeight,
            child: ColorPicker(
              themeSettings: themeSettings,
              selectedColor: currentValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}


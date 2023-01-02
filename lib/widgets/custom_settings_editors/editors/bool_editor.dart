import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/radio_button.dart';

import '../ui_elements/heading.dart';

class ManualWidgetTesterCustomSettingsBoolEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsBoolEditor(
      {Key? key,
      required this.themeSettings,
      required this.settingName,
      required this.currentValue,
      required this.onChanged})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final bool currentValue;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(
              themeSettings: themeSettings, settingName: settingName),
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: themeSettings.boolEditorTheme.boolEditorMaxWidth,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRadioButtonWithLabel(true),
                  ),
                  SizedBox(
                      width: themeSettings
                          .boolEditorTheme.boolEditorSpaceBetweenRadioButtons),
                  Expanded(
                    child: _buildRadioButtonWithLabel(false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButtonWithLabel(bool isTrue) {
    return MouseRegion(
      cursor:
          isTrue != currentValue ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTapDown: (_) => onChanged(isTrue),
        child: Container(
          padding: themeSettings.boolEditorTheme.boolEditorRadioButtonPadding,
          color: Colors.transparent,
          child: SizedBox(
            height: themeSettings.boolEditorTheme.boolEditorHeight,
            child: ManualWidgetTesterRadioButtonWithLabel(
              themeSettings: themeSettings,
              isSelected: isTrue ? currentValue : !currentValue,
              label: '$isTrue',
            ),
          ),
        ),
      ),
    );
  }
}

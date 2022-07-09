import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class ManualWidgetTesterCustomSettingsHeading extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsHeading({
    Key? key,
    required this.themeSettings,
    required this.settingName,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsHeadingPadding,
      child: Text(
        '$settingName:',
        softWrap: false,
        overflow: themeSettings.customSettingHeadingOverflow,
        style: themeSettings.customSettingHeadingTextStyle,
      ),
    );
  }
}
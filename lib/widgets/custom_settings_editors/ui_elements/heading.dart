import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ManualWidgetTesterCustomSettingsHeading extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsHeading({
    super.key,
    required this.settingName,
  });

  final String settingName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          ManualWidgetTesterTheme.of(context).customSettingHeadingTheme.padding,
      child: Text(
        '$settingName:',
        softWrap: false,
        overflow: ManualWidgetTesterTheme.of(context)
            .customSettingHeadingTheme
            .overflow,
        style: ManualWidgetTesterTheme.of(context)
            .customSettingHeadingTheme
            .textStyle,
      ),
    );
  }
}

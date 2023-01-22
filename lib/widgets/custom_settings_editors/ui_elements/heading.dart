import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ManualWidgetTesterCustomSettingsHeading extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsHeading({
    Key? key,
    required this.settingName,
  }) : super(key: key);

  final String settingName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context)
          .customSettingHeadingTheme
          .customSettingHeadingPadding,
      child: Text(
        '$settingName:',
        softWrap: false,
        overflow: ManualWidgetTesterTheme.of(context)
            .customSettingHeadingTheme
            .customSettingHeadingOverflow,
        style: ManualWidgetTesterTheme.of(context)
            .customSettingHeadingTheme
            .customSettingHeadingTextStyle,
      ),
    );
  }
}

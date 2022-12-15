import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/double_editor/double_editor.dart';

class ManualWidgetTesterGenericSettingsEdgeInsetEditor extends StatelessWidget {
  const ManualWidgetTesterGenericSettingsEdgeInsetEditor(
      {super.key,
      required this.themeSettings,
      required this.settingName,
      required this.currentEdgeInsets,
      required this.onChanged,
      required this.infiniteScrollViewRange,
      required this.infiniteScrollViewScrollSpeedFactor,
      this.onlyAllowPositiveValues = false});

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final EdgeInsets currentEdgeInsets;
  final void Function(EdgeInsets) onChanged;
  final double infiniteScrollViewRange;
  final double infiniteScrollViewScrollSpeedFactor;
  final bool onlyAllowPositiveValues;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ManualWidgetTesterCustomSettingsDoubleEditor(
          themeSettings: themeSettings,
          settingName: '$settingName.left',
          currentValue: currentEdgeInsets.left,
          onChanged: (double newValue) {
            final newEdgeInsets =
                currentEdgeInsets.copyWith(left: max(0.0, newValue));
            onChanged(newEdgeInsets);
          },
          infiniteScrollViewRange: infiniteScrollViewRange,
          infiniteScrollViewScrollSpeedFactor:
              infiniteScrollViewScrollSpeedFactor,
          lowerLimit: onlyAllowPositiveValues ? 0.0 : double.negativeInfinity,
        ),
        ManualWidgetTesterCustomSettingsDoubleEditor(
          themeSettings: themeSettings,
          settingName: '$settingName.top',
          currentValue: currentEdgeInsets.top,
          onChanged: (double newValue) {
            final newEdgeInsets =
                currentEdgeInsets.copyWith(top: max(0.0, newValue));
            onChanged(newEdgeInsets);
          },
          infiniteScrollViewRange: infiniteScrollViewRange,
          infiniteScrollViewScrollSpeedFactor:
              infiniteScrollViewScrollSpeedFactor,
          lowerLimit: onlyAllowPositiveValues ? 0.0 : double.negativeInfinity,
        ),
        ManualWidgetTesterCustomSettingsDoubleEditor(
          themeSettings: themeSettings,
          settingName: '$settingName.right',
          currentValue: currentEdgeInsets.right,
          onChanged: (double newValue) {
            final newEdgeInsets =
                currentEdgeInsets.copyWith(right: max(0.0, newValue));
            onChanged(newEdgeInsets);
          },
          infiniteScrollViewRange: infiniteScrollViewRange,
          infiniteScrollViewScrollSpeedFactor:
              infiniteScrollViewScrollSpeedFactor,
          lowerLimit: onlyAllowPositiveValues ? 0.0 : double.negativeInfinity,
        ),
        ManualWidgetTesterCustomSettingsDoubleEditor(
          themeSettings: themeSettings,
          settingName: '$settingName.bottom',
          currentValue: currentEdgeInsets.bottom,
          onChanged: (double newValue) {
            final newEdgeInsets =
                currentEdgeInsets.copyWith(bottom: max(0.0, newValue));
            onChanged(newEdgeInsets);
          },
          infiniteScrollViewRange: infiniteScrollViewRange,
          infiniteScrollViewScrollSpeedFactor:
              infiniteScrollViewScrollSpeedFactor,
          lowerLimit: onlyAllowPositiveValues ? 0.0 : double.negativeInfinity,
        ),
      ],
    );
  }
}

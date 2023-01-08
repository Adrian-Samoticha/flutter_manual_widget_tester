import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/double_editor/double_editor.dart';

class ManualWidgetTesterGenericSettingsEdgeInsetEditor extends StatelessWidget {
  /// Creates an editor for an `EdgeInsets` setting.
  ///
  /// The [key] is used to identify this widget in the widget tree.
  /// The [themeSettings] is the theme settings for the widget.
  /// The [settingName] is the name of the setting.
  /// The [currentEdgeInsets] is the current value of the setting.
  /// The [onChanged] is a callback that is called when the value of the setting
  /// is changed.
  /// The [infiniteScrollViewRange] is the range of the infinite scroll view.
  /// The [infiniteScrollViewScrollSpeedFactor] is the scroll speed factor of
  /// the infinite scroll view.
  /// The [onlyAllowPositiveValues] specifies whether only positive values are
  /// allowed for the setting.
  const ManualWidgetTesterGenericSettingsEdgeInsetEditor(
      {super.key,
      required this.themeSettings,
      required this.settingName,
      required this.currentEdgeInsets,
      required this.onChanged,
      this.onlyAllowPositiveValues = false});

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final EdgeInsets currentEdgeInsets;
  final void Function(EdgeInsets) onChanged;
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
          lowerLimit: onlyAllowPositiveValues ? 0.0 : double.negativeInfinity,
        ),
      ],
    );
  }
}

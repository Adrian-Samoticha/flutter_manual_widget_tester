import 'dart:ui';

import 'package:flutter_manual_widget_tester/backend/constrained_types/clamped_double.dart';
import 'package:flutter_manual_widget_tester/backend/constrained_types/clamped_int.dart';
import 'package:flutter_manual_widget_tester/backend/constrained_types/constrained_int.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/bool_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/color_editor/color_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/double_editor/double_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/int_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/string_editor.dart';

class EditorBuilderInstaller {
  static void installDefaultEditorBuilders({
    required TypeEditorBuilder typeEditorBuilder,
  }) {
    typeEditorBuilder.installEditorBuilder<String>((
      String settingName,
      String currentValue,
      void Function(String) onChanged,
    ) {
      return ManualWidgetTesterCustomSettingsStringEditor(
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
      );
    });

    typeEditorBuilder.installEditorBuilder<Color>((
      String settingName,
      Color currentValue,
      void Function(Color) onChanged,
    ) {
      return ManualWidgetTesterCustomSettingsColorEditor(
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
      );
    });

    typeEditorBuilder.installEditorBuilder<int>(
      (String settingName, int currentValue, void Function(int) onChanged) {
        return ManualWidgetTesterCustomSettingsIntEditor(
          settingName: settingName,
          currentValue: currentValue,
          onChanged: onChanged,
        );
      },
    );

    typeEditorBuilder.installEditorBuilder<double>((
      String settingName,
      double currentValue,
      void Function(double) onChanged,
    ) {
      return ManualWidgetTesterCustomSettingsDoubleEditor(
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
      );
    });

    typeEditorBuilder.installEditorBuilder<bool>(
      (String settingName, bool currentValue, void Function(bool) onChanged) {
        return ManualWidgetTesterCustomSettingsBoolEditor(
          settingName: settingName,
          currentValue: currentValue,
          onChanged: onChanged,
        );
      },
    );

    typeEditorBuilder.installEditorBuilder<ClampedDouble>(
      (settingName, currentValue, onChanged) {
        return ManualWidgetTesterCustomSettingsDoubleEditor(
          settingName: settingName,
          currentValue: currentValue.value,
          onChanged: (double newValue) {
            onChanged(currentValue..value = newValue);
          },
          lowerLimit: currentValue.lowerLimit,
          upperLimit: currentValue.upperLimit,
        );
      },
    );

    typeEditorBuilder.installEditorBuilder<ClampedInt>((
      String settingName,
      ClampedInt currentValue,
      void Function(ClampedInt) onChanged,
    ) {
      return ManualWidgetTesterCustomSettingsIntEditor(
        settingName: settingName,
        currentValue: currentValue.value,
        onChanged: (int newValue) {
          onChanged(currentValue..value = newValue);
        },
        lowerValue: currentValue.lowerLimit,
        upperValue: currentValue.upperLimit,
      );
    });

    typeEditorBuilder.installEditorBuilder<ConstrainedInt>((
      String settingName,
      ConstrainedInt currentValue,
      void Function(ConstrainedInt) onChanged,
    ) {
      return ManualWidgetTesterCustomSettingsIntEditor(
        settingName: settingName,
        currentValue: currentValue.value,
        onChanged: (int newValue) {
          onChanged(currentValue..value = newValue);
        },
        lowerValue: currentValue.lowerLimit,
        upperValue: currentValue.upperLimit,
        stepSize: currentValue.divisor,
      );
    });
  }
}

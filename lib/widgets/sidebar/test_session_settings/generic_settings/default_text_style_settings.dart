import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_generic_settings.dart';
import 'package:flutter_manual_widget_tester/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/editors/double_editor/double_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class DefaultTextStyleSettings extends StatelessWidget {
  const DefaultTextStyleSettings({
    Key? key,
    required this.themeSettings,
    required this.config,
    required this.session,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final ManualWidgetTesterConfig config;
  final WidgetTestSession session;

  WidgetTestSessionGenericSettings get _genericSettings =>
      session.genericSettings;

  String _formatSettingNameForFoldableRegionUsage(String settingName) {
    return StringUtils.camelCaseToUpperUnderscore(settingName)
        .replaceAll('_', ' ')
        .replaceAll('  ', ' ')
        .trim();
  }

  ManualWidgetTesterFoldableRegion _buildDoubleEditor({
    required String settingName,
    required double currentValue,
    required TextStyle Function(TextStyle, double) copyWithChangedData,
    double lowerLimit = double.negativeInfinity,
    double upperLimit = double.infinity,
  }) {
    return ManualWidgetTesterFoldableRegion(
      heading: _formatSettingNameForFoldableRegionUsage(settingName),
      themeSettings: themeSettings,
      isIndented: true,
      isInitiallyFolded: true,
      child: ManualWidgetTesterCustomSettingsDoubleEditor(
        themeSettings: themeSettings,
        settingName: settingName,
        currentValue: currentValue,
        onChanged: (double newValue) {
          final newTextStyle =
              copyWithChangedData(_genericSettings.defaultTextStyle, newValue);
          _genericSettings.defaultTextStyle = newTextStyle;
        },
        infiniteScrollViewRange: config.doubleEditorInfiniteScrollViewRange,
        infiniteScrollViewScrollSpeedFactor:
            config.doubleEditorInfiniteScrollViewScrollSpeedFactor,
        lowerLimit: lowerLimit,
        upperLimit: upperLimit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      heading: 'DEFAULT TEXT STYLE',
      themeSettings: themeSettings,
      isIndented: true,
      isInitiallyFolded: true,
      child: Column(
        children: [
          _buildDoubleEditor(
            settingName: 'fontSize',
            currentValue: _genericSettings.defaultTextStyle.fontSize ??
                DefaultTextStyleProvider.defaultTextStyle.fontSize ??
                0.0,
            copyWithChangedData: (TextStyle textStyle, double newValue) {
              return textStyle.copyWith(fontSize: max(0.0, newValue));
            },
            lowerLimit: 0.0,
          ),
        ],
      ),
    );
  }
}

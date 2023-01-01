import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_generic_settings.dart';
import 'package:flutter_manual_widget_tester/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/generic_settings_editors/editors/edge_inset_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class MediaQuerySettings extends StatelessWidget {
  const MediaQuerySettings({
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

  ManualWidgetTesterFoldableRegion _buildEdgeInsetEditor({
    required String settingName,
    required EdgeInsets currentEdgeInsets,
    required MediaQueryData Function(MediaQueryData, EdgeInsets)
        copyWithChangedData,
  }) {
    return ManualWidgetTesterFoldableRegion(
      heading: _formatSettingNameForFoldableRegionUsage(settingName),
      themeSettings: themeSettings,
      isIndented: true,
      isInitiallyFolded: true,
      child: ManualWidgetTesterGenericSettingsEdgeInsetEditor(
        themeSettings: themeSettings,
        settingName: settingName,
        currentEdgeInsets: currentEdgeInsets,
        onChanged: (EdgeInsets newPadding) {
          final newMediaQueryData =
              copyWithChangedData(_genericSettings.mediaQueryData, newPadding);
          _genericSettings.mediaQueryData = newMediaQueryData;
        },
        infiniteScrollViewRange: config.doubleEditorInfiniteScrollViewRange,
        infiniteScrollViewScrollSpeedFactor:
            config.doubleEditorInfiniteScrollViewScrollSpeedFactor,
        onlyAllowPositiveValues: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      heading: 'MEDIA QUERY',
      themeSettings: themeSettings,
      isIndented: true,
      isInitiallyFolded: true,
      child: Column(
        children: [
          _buildEdgeInsetEditor(
            settingName: 'padding',
            currentEdgeInsets: _genericSettings.mediaQueryData.padding,
            copyWithChangedData:
                (MediaQueryData mediaQueryData, EdgeInsets newEdgeInsets) {
              return mediaQueryData.copyWith(padding: newEdgeInsets);
            },
          ),
          _buildEdgeInsetEditor(
            settingName: 'viewInsets',
            currentEdgeInsets: _genericSettings.mediaQueryData.viewInsets,
            copyWithChangedData:
                (MediaQueryData mediaQueryData, EdgeInsets newEdgeInsets) {
              return mediaQueryData.copyWith(viewInsets: newEdgeInsets);
            },
          ),
          _buildEdgeInsetEditor(
            settingName: 'viewPadding',
            currentEdgeInsets: _genericSettings.mediaQueryData.viewPadding,
            copyWithChangedData:
                (MediaQueryData mediaQueryData, EdgeInsets newEdgeInsets) {
              return mediaQueryData.copyWith(viewPadding: newEdgeInsets);
            },
          ),
        ],
      ),
    );
  }
}

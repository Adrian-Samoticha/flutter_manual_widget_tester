import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
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

  @override
  Widget build(BuildContext context) {
    final genericSettings = session.genericSettings;

    return ManualWidgetTesterFoldableRegion(
      heading: 'MEDIA QUERY',
      themeSettings: themeSettings,
      isIndented: true,
      isInitiallyFolded: true,
      child: Column(
        children: [
          ManualWidgetTesterFoldableRegion(
            heading: 'PADDING',
            themeSettings: themeSettings,
            isIndented: true,
            isInitiallyFolded: true,
            child: ManualWidgetTesterGenericSettingsEdgeInsetEditor(
              themeSettings: themeSettings,
              settingName: 'padding',
              currentEdgeInsets: genericSettings.mediaQueryData.padding,
              onChanged: (EdgeInsets newPadding) {
                final newMediaQueryData = genericSettings.mediaQueryData
                    .copyWith(padding: newPadding);
                genericSettings.mediaQueryData = newMediaQueryData;
              },
              infiniteScrollViewRange:
                  config.doubleEditorInfiniteScrollViewRange,
              infiniteScrollViewScrollSpeedFactor:
                  config.doubleEditorInfiniteScrollViewScrollSpeedFactor,
              onlyAllowPositiveValues: true,
            ),
          ),
          ManualWidgetTesterFoldableRegion(
            heading: 'VIEW INSETS',
            themeSettings: themeSettings,
            isIndented: true,
            isInitiallyFolded: true,
            child: ManualWidgetTesterGenericSettingsEdgeInsetEditor(
              themeSettings: themeSettings,
              settingName: 'viewInsets',
              currentEdgeInsets: genericSettings.mediaQueryData.viewInsets,
              onChanged: (EdgeInsets newViewInsets) {
                final newMediaQueryData = genericSettings.mediaQueryData
                    .copyWith(viewInsets: newViewInsets);
                genericSettings.mediaQueryData = newMediaQueryData;
              },
              infiniteScrollViewRange:
                  config.doubleEditorInfiniteScrollViewRange,
              infiniteScrollViewScrollSpeedFactor:
                  config.doubleEditorInfiniteScrollViewScrollSpeedFactor,
              onlyAllowPositiveValues: true,
            ),
          ),
          ManualWidgetTesterFoldableRegion(
            heading: 'VIEW PADDING',
            themeSettings: themeSettings,
            isIndented: true,
            isInitiallyFolded: true,
            child: ManualWidgetTesterGenericSettingsEdgeInsetEditor(
              themeSettings: themeSettings,
              settingName: 'viewPadding',
              currentEdgeInsets: genericSettings.mediaQueryData.viewPadding,
              onChanged: (EdgeInsets newViewPadding) {
                final newMediaQueryData = genericSettings.mediaQueryData
                    .copyWith(viewPadding: newViewPadding);
                genericSettings.mediaQueryData = newMediaQueryData;
              },
              infiniteScrollViewRange:
                  config.doubleEditorInfiniteScrollViewRange,
              infiniteScrollViewScrollSpeedFactor:
                  config.doubleEditorInfiniteScrollViewScrollSpeedFactor,
              onlyAllowPositiveValues: true,
            ),
          ),
        ],
      ),
    );
  }
}

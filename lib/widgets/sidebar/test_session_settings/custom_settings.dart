import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_custom_settings.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class CustomSettings extends StatelessWidget {
  /// Creates a widget that displays custom settings for a widget test session.
  ///
  /// The [key] is used to identify this widget in the widget tree.
  /// The [themeSettings] is the theme settings for the widget.
  /// The [session] is the widget test session for which the custom settings are
  /// displayed.
  /// The [typeEditorBuilder] is the type editor builder used to build editors
  /// for the custom settings.
  const CustomSettings(
      {Key? key,
      required this.themeSettings,
      required this.session,
      required this.typeEditorBuilder})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSession session;
  final TypeEditorBuilder typeEditorBuilder;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      isIndented: true,
      heading: 'CUSTOM SETTINGS',
      themeSettings: themeSettings,
      child: Column(
        children: _generateCustomSettingsChildren(),
      ),
    );
  }

  List<Widget> _generateCustomSettingsChildren() {
    final customSettings = session.customSettings;

    if (customSettings.settings.isEmpty) {
      return [_buildNoSettingsText()];
    }

    return customSettings.settings
        .map((String settingName, dynamic settingValue) {
          final widget =
              _buildWidgetForSetting(customSettings, settingName, settingValue);
          return MapEntry<String, Widget>(settingName, widget);
        })
        .values
        .toList();
  }

  Widget _buildWidgetForSetting(WidgetTestSessionCustomSettings customSettings,
      String settingName, dynamic settingValue) {
    final settingType = settingValue.runtimeType;

    if (!typeEditorBuilder.hasEditorBuilderInstalledForType(settingType)) {
      return _buildNoEditorMessage(settingName, settingValue);
    }

    return typeEditorBuilder.buildEditor(
      settingName,
      settingType,
      settingValue,
      (Object? newValue) {
        customSettings.setSetting(settingName, newValue);
      },
    );
  }

  Container _buildNoEditorMessage(String settingName, settingValue) {
    return Container(
      padding: themeSettings.noEditorMessageTheme.noEditorMessagePadding,
      margin: themeSettings.noEditorMessageTheme.noEditorMessageMargin,
      decoration: themeSettings.noEditorMessageTheme.noEditorMessageDecoration,
      child: _buildNoEditorText(settingName, settingValue),
    );
  }

  RichText _buildNoEditorText(String settingName, settingValue) {
    return RichText(
      text: TextSpan(
        text: 'Could not build type editor for setting ',
        style: themeSettings.noEditorMessageTheme.noEditorTextStyle,
        children: [
          TextSpan(
            text: settingName,
            style:
                themeSettings.noEditorMessageTheme.noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: ' which is of type ',
          ),
          TextSpan(
            text: '${settingValue.runtimeType}',
            style:
                themeSettings.noEditorMessageTheme.noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: '. No editor for that type has been provided.',
          ),
        ],
      ),
    );
  }

  Padding _buildNoSettingsText() {
    return Padding(
      padding: themeSettings
          .noCustomSettingsMessageTheme.noCustomSettingsMessagePadding,
      child: Text(
        'This test session has no custom settings.',
        style: themeSettings
            .noCustomSettingsMessageTheme.noCustomSettingsMessageTextStyle,
      ),
    );
  }
}

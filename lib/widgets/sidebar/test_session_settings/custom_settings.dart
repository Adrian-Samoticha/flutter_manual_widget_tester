import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_custom_settings.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class CustomSettings extends StatelessWidget {
  /// Creates a widget that displays custom settings for a widget test session.
  ///
  /// The [key] is used to identify this widget in the widget tree.
  /// The [themeData] is the theme settings for the widget.
  /// The [session] is the widget test session for which the custom settings are
  /// displayed.
  /// The [typeEditorBuilder] is the type editor builder used to build editors
  /// for the custom settings.
  const CustomSettings(
      {Key? key, required this.session, required this.typeEditorBuilder})
      : super(key: key);

  final WidgetTestSession session;
  final TypeEditorBuilder typeEditorBuilder;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      isIndented: true,
      heading: 'CUSTOM SETTINGS',
      child: Column(
        children: _generateCustomSettingsChildren(context),
      ),
    );
  }

  List<Widget> _generateCustomSettingsChildren(BuildContext context) {
    final customSettings = session.customSettings;

    if (customSettings.settings.isEmpty) {
      return [_buildNoSettingsText(context)];
    }

    return customSettings.settings
        .map((String settingName, dynamic settingValue) {
          final widget = _buildWidgetForSetting(
              context, customSettings, settingName, settingValue);
          return MapEntry<String, Widget>(settingName, widget);
        })
        .values
        .toList();
  }

  Widget _buildWidgetForSetting(
      BuildContext context,
      WidgetTestSessionCustomSettings customSettings,
      String settingName,
      dynamic settingValue) {
    final settingType = settingValue.runtimeType;

    if (!typeEditorBuilder.hasEditorBuilderInstalledForType(settingType)) {
      return _buildNoEditorMessage(context, settingName, settingValue);
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

  Container _buildNoEditorMessage(
      BuildContext context, String settingName, settingValue) {
    return Container(
      padding: ManualWidgetTesterTheme.of(context)
          .noEditorMessageTheme
          .noEditorMessagePadding,
      margin: ManualWidgetTesterTheme.of(context)
          .noEditorMessageTheme
          .noEditorMessageMargin,
      decoration: ManualWidgetTesterTheme.of(context)
          .noEditorMessageTheme
          .noEditorMessageDecoration,
      child: _buildNoEditorText(context, settingName, settingValue),
    );
  }

  RichText _buildNoEditorText(
      BuildContext context, String settingName, settingValue) {
    return RichText(
      text: TextSpan(
        text: 'Could not build type editor for setting ',
        style: ManualWidgetTesterTheme.of(context)
            .noEditorMessageTheme
            .noEditorTextStyle,
        children: [
          TextSpan(
            text: settingName,
            style: ManualWidgetTesterTheme.of(context)
                .noEditorMessageTheme
                .noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: ' which is of type ',
          ),
          TextSpan(
            text: '${settingValue.runtimeType}',
            style: ManualWidgetTesterTheme.of(context)
                .noEditorMessageTheme
                .noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: '. No editor for that type has been provided.',
          ),
        ],
      ),
    );
  }

  Padding _buildNoSettingsText(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context)
          .noCustomSettingsMessageTheme
          .noCustomSettingsMessagePadding,
      child: Text(
        'This test session has no custom settings.',
        style: ManualWidgetTesterTheme.of(context)
            .noCustomSettingsMessageTheme
            .noCustomSettingsMessageTextStyle,
      ),
    );
  }
}

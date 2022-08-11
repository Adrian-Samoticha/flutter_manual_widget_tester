import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class CustomSettings extends StatelessWidget {
  const CustomSettings({Key? key, required this.themeSettings, required this.widgetTestSessionHandler, required this.typeEditorBuilder}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSessionHandler widgetTestSessionHandler;
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
    final currentIndex = widgetTestSessionHandler.currentIndex;
    final currentTestSession = widgetTestSessionHandler.widgetTestSessions[currentIndex];
    final customSettings = currentTestSession.customSettings;
    
    if (customSettings.settings.isEmpty) {
      return [
        _generateNoSettingsText(),
      ];
    }
    
    return customSettings.settings.map((String settingName, dynamic settingValue) {
      final settingType = settingValue.runtimeType;
      
      if (!typeEditorBuilder.hasEditorBuilderInstalledForType(settingType)) {
        final widgetToBeReturned = _generateNoEditorMessage(settingName, settingValue);
        
        return MapEntry<String, Widget>(settingName, widgetToBeReturned);
      }
      
      final widgetToBeReturned = typeEditorBuilder.buildEditor(settingName, settingType, settingValue, (newValue) {
        customSettings.setSetting(settingName, newValue);
      });
      
      return MapEntry<String, Widget>(settingName, widgetToBeReturned);
    }).values.toList();
  }
  
  Container _generateNoEditorMessage(String settingName, settingValue) {
    return Container(
      padding: themeSettings.noEditorMessagePadding,
      margin: themeSettings.noEditorMessageMargin,
      decoration: themeSettings.noEditorMessageDecoration,
      child: _generateNoEditorText(settingName, settingValue),
    );
  }
  
  RichText _generateNoEditorText(String settingName, settingValue) {
    return RichText(
      text: TextSpan(
        text: 'Could not build type editor for setting ',
        style: themeSettings.noEditorTextStyle,
        children: [
          TextSpan(
            text: settingName,
            style: themeSettings.noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: ' which is of type ',
          ),
          TextSpan(
            text: '${settingValue.runtimeType}',
            style: themeSettings.noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: '. No editor for that type has been provided.',
          ),
        ],
      ),
    );
  }
  
  Padding _generateNoSettingsText() {
    return Padding(
      padding: themeSettings.noCustomSettingsMessagePadding,
      child: Text(
        'This test session has no custom settings.',
        style: themeSettings.noCustomSettingsMessageTextStyle,
      ),
    );
  }
}
library flutter_manual_widget_tester;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/list_has_duplicates.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/app_bar/app_bar.dart';
import 'package:flutter_manual_widget_tester/widgets/background.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/bool_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/color_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/double_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/int_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/string_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/sidebar/sidebar.dart';
import 'package:flutter_manual_widget_tester/widgets/widget_test_session_area_stack/widget_test_session_area_stack.dart';

class ManualWidgetTester extends StatefulWidget {
  const ManualWidgetTester({Key? key, this.themeSettings = const ManualWidgetTesterThemeSettings(), this.doubleEditorInfiniteScrollViewRange = 3.0, this.doubleEditorInfiniteScrollViewScrollSpeedFactor = 0.003, required this.builders}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final double doubleEditorInfiniteScrollViewRange;
  final double doubleEditorInfiniteScrollViewScrollSpeedFactor;
  final List<WidgetTestBuilder> builders;

  @override
  State<ManualWidgetTester> createState() => _ManualWidgetTesterState();
}

class _ManualWidgetTesterState extends State<ManualWidgetTester> {
  final _mouseCursorOverrider = MouseCursorOverrider();
  final _widgetTestSessionHandler = WidgetTestSessionHandler();
  late final StreamSubscription<MouseCursorOverrider> _onMouseCursorOverrideChangedStreamSubscription;
  final TypeEditorBuilder _typeEditorBuilder = TypeEditorBuilder();
  
  @override
  void initState() {
    _onMouseCursorOverrideChangedStreamSubscription = _mouseCursorOverrider.registerOnMouseCursorOverrideChanged((_) {
      setState(() {});
    });
    
    _typeEditorBuilder.installEditorBuilder<String>((String settingName, String currentValue, void Function(String) onChanged) {
      return ManualWidgetTesterCustomSettingsStringEditor(
        themeSettings: widget.themeSettings,
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
      );
    });
    
    _typeEditorBuilder.installEditorBuilder<Color>((String settingName, Color currentValue, void Function(Color) onChanged) {
      return ManualWidgetTesterCustomSettingsColorEditor(
        themeSettings: widget.themeSettings,
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
      );
    });
    
    _typeEditorBuilder.installEditorBuilder<int>((String settingName, int currentValue, void Function(int) onChanged) {
      return ManualWidgetTesterCustomSettingsIntEditor(
        themeSettings: widget.themeSettings,
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
      );
    });
    
    _typeEditorBuilder.installEditorBuilder<double>((String settingName, double currentValue, void Function(double) onChanged) {
      return ManualWidgetTesterCustomSettingsDoubleEditor(
        themeSettings: widget.themeSettings,
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
        infiniteScrollViewRange: widget.doubleEditorInfiniteScrollViewRange,
        infiniteScrollViewScrollSpeedFactor: widget.doubleEditorInfiniteScrollViewScrollSpeedFactor,
      );
    });
    
    _typeEditorBuilder.installEditorBuilder<bool>((String settingName, bool currentValue, void Function(bool) onChanged) {
      return ManualWidgetTesterCustomSettingsBoolEditor(
        themeSettings: widget.themeSettings,
        settingName: settingName,
        currentValue: currentValue,
        onChanged: onChanged,
      );
    });
    
    super.initState();
  }
  
  @override
  void dispose() {
    _onMouseCursorOverrideChangedStreamSubscription.cancel();
    
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    if (widget.builders.hasDuplicates((WidgetTestBuilder builder) => builder.key)) {
      throw ArgumentError('Found duplicate keys in `builders` list. All WidgetTestBuilders must have unique keys.');
    }
    
    for (final WidgetTestBuilder builder in widget.builders) {
      _widgetTestSessionHandler.updateSessions(builder);
    }
    
    return DefaultTextStyle(
      style: DefaultTextStyleProvider.defaultTextStyle,
      child: MouseRegion(
        cursor: _mouseCursorOverrider.currentMouseCursor,
        child: Stack(
          children: [
            ManualWidgetTesterBackground(
              color: widget.themeSettings.backgroundColor,
            ),
            _ManualWidgetTesterBody(
              themeSettings: widget.themeSettings,
              mouseCursorOverrider: _mouseCursorOverrider,
              widgetTestSessionHandler: _widgetTestSessionHandler,
              typeEditorBuilder: _typeEditorBuilder,
              builders: widget.builders,
            ),
          ],
        ),
      ),
    );
  }
}

class _ManualWidgetTesterBody extends StatelessWidget {
  const _ManualWidgetTesterBody({
    Key? key,
    required this.themeSettings,
    required this.mouseCursorOverrider,
    required this.widgetTestSessionHandler,
    required this.typeEditorBuilder,
    required this.builders,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final MouseCursorOverrider mouseCursorOverrider;
  final WidgetTestSessionHandler widgetTestSessionHandler;
  final TypeEditorBuilder typeEditorBuilder;
  final List<WidgetTestBuilder> builders;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ManualWidgetTesterSidebar(
              themeSettings: themeSettings,
              maxWidth: constraints.maxWidth - 128.0,
              mouseCursorOverrider: mouseCursorOverrider,
              widgetTestSessionHandler: widgetTestSessionHandler,
              typeEditorBuilder: typeEditorBuilder,
            ),
            Expanded(
              child: Column(
                children: [
                  ManualWidgetTesterAppBar(
                    themeSettings: themeSettings,
                    widgetTestSessionHandler: widgetTestSessionHandler,
                    builders: builders,
                  ),
                  Expanded(
                    child: ManualWidgetTesterWidgetTestSessionAreaStack(
                      mouseCursorOverrider: mouseCursorOverrider,
                      themeSettings: themeSettings,
                      widgetTestSessionHandler: widgetTestSessionHandler,
                    )
                  ),
                ],
              ),
            ),
          ]
        );
      }
    );
  }
}
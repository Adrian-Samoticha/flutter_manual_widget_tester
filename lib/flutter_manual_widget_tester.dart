library flutter_manual_widget_tester;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/app_bar.dart';
import 'package:flutter_manual_widget_tester/widgets/background.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/color_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/int_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/string_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/sidebar.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/close_button.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';
import 'package:flutter_manual_widget_tester/widgets/widget_test_session_area_stack.dart';

class ManualWidgetTester extends StatefulWidget {
  const ManualWidgetTester({Key? key, this.themeSettings = const ManualWidgetTesterThemeSettings()}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;

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
    // TODO: remove after testing
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(name: 'ThemeSettings', builder: (_, __) => Container(
      color: Colors.blue,
      child: const Text('foo'),
    )));
    
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(name: 'MouseCursorOverrider', icon: Icons.api, builder: (_, __) => Container(
      color: widget.themeSettings.sidebarColor,
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ManualWidgetTesterTextField(
                themeSettings: widget.themeSettings,
                initialValue: '100',
                disableRoundedCornersOnRightSide: true,
                onSubmitted: (text) => print(text),
                suffix: '%',
              ),
            ),
            const SizedBox(width: 0.5),
            SizedBox(
              width: 64.0,
              child: ManualWidgetTesterButtonRow(
                themeSettings: widget.themeSettings,
                disableRoundedCornersOnLeftSide: true,
                buttons: [
                  ManualWidgetTesterButtonInfo(onButtonDown: () => print('onButtonDown'), onButtonPressed: () => print('onButtonPressed'), child: const Icon(Icons.zoom_out)),
                  ManualWidgetTesterButtonInfo(onButtonDown: null, onButtonPressed: null, child: const Icon(Icons.zoom_in)),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
    
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(
      name: 'ManualWidgetTesterFoldableRegion',
      icon: Icons.folder_outlined,
      builder: (_, settings) {
        final text = settings.getSetting('text', 'foo') * settings.getSetting('textFactor', 1);
        final someColor = settings.getSetting('someColor', const Color.fromRGBO(255, 255, 255, 1.0));
        
        return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ManualWidgetTesterFoldableRegion(
              themeSettings: widget.themeSettings,
              heading: 'FOLDABLE REGION',
              isIndented: false,
              child: ManualWidgetTesterFoldableRegion(
                themeSettings: widget.themeSettings,
                heading: 'INDENTED FOLDABLE REGION',
                isIndented: true,
                child: Text('$text\n$text\n$text\n$text\n$text\n$text', style: TextStyle(color: someColor)),
              ),
            ),
            ManualWidgetTesterFoldableRegion(
              themeSettings: widget.themeSettings,
              heading: 'FOLDABLE REGION',
              isIndented: false,
              child: Text('$text\n$text\n$text\n$text\n$text\n$text', style: TextStyle(color: someColor)),
            ),
          ],
        ),
      );
      },
    ));
    
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(
      name: 'ManualWidgetTesterCloseButton',
      icon: Icons.close,
      builder: (_, __) => ManualWidgetTesterCloseButton(
        themeSettings: widget.themeSettings,
        onPressed: () => print('closed'),
      ),
    ));
    
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(
      name: 'ManualWidgetTesterCustomSettingsColorEditor',
      icon: Icons.color_lens,
      builder: (_, __) => Builder(
        builder: (context) {
          var color = const Color.fromRGBO(255, 0, 128, 0.75);
          return StatefulBuilder(
            builder: (context, setState) {
              return ManualWidgetTesterCustomSettingsColorEditor(
                themeSettings: widget.themeSettings,
                currentValue: color,
                onChanged: (newColor) => setState(() {
                  color = newColor;
                  print(newColor);
                }),
                settingName: 'backgroundColor',
              );
            }
          );
        }
      ),
    ));
    
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(
      name: 'ManualWidgetTesterCustomSettingsIntEditor',
      icon: Icons.numbers,
      builder: (_, __) => Builder(
        builder: (context) {
          var integer = 0;
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                color: widget.themeSettings.sidebarColor,
                child: ManualWidgetTesterCustomSettingsIntEditor(
                  themeSettings: widget.themeSettings,
                  currentValue: integer,
                  onChanged: (newInteger) => setState(() {
                    integer = newInteger;
                    print(newInteger);
                  }),
                  settingName: 'backgroundColor',
                ),
              );
            }
          );
        }
      ),
    ));
    
    //////////////////////////
    
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
    
    super.initState();
  }
  
  @override
  void dispose() {
    _onMouseCursorOverrideChangedStreamSubscription.cancel();
    
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
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
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final MouseCursorOverrider mouseCursorOverrider;
  final WidgetTestSessionHandler widgetTestSessionHandler;
  final TypeEditorBuilder typeEditorBuilder;

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
library flutter_manual_widget_tester;

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/appbar.dart';
import 'package:flutter_manual_widget_tester/widgets/background.dart';
import 'package:flutter_manual_widget_tester/widgets/sidebar.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row.dart';
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
  
  @override
  void initState() {
    // TODO: remove after testing
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(name: 'ThemeSettings', widget: Container(
      color: Colors.blue,
      child: const Text('foo'),
    )));
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(name: 'MouseCursorOverrider', icon: Icons.api, widget: Container(
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
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(name: 'MouseCursorOverriderTestWidget'));
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    _mouseCursorOverrider.setSetStateFunction(setState);
    
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.black,
      ),
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
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final MouseCursorOverrider mouseCursorOverrider;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ManualWidgetTesterSidebar(
              sidebarColor: themeSettings.sidebarColor,
              maxWidth: constraints.maxWidth - 128.0,
              mouseCursorOverrider: mouseCursorOverrider,
            ),
            Expanded(
              child: Column(
                children: [
                  ManualWidgetTesterAppbar(
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
library flutter_manual_widget_tester;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/appbar.dart';
import 'package:flutter_manual_widget_tester/widgets/background.dart';
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
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(
      name: 'ManualWidgetTesterFoldableRegion',
      icon: Icons.folder_outlined,
      widget: SingleChildScrollView(
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
                child: Text('foo\nfoo\nfoo\nfoo\nfoo\nfoo', style: widget.themeSettings.buttonTextStyle),
              ),
            ),
            ManualWidgetTesterFoldableRegion(
              themeSettings: widget.themeSettings,
              heading: 'FOLDABLE REGION',
              child: Text('foo\nfoo\nfoo\nfoo\nfoo\nfoo', style: widget.themeSettings.buttonTextStyle),
              isIndented: false,
            ),
          ],
        ),
      ),
    ));
    
    _widgetTestSessionHandler.createNewSession(WidgetTestSession(
      name: 'ManualWidgetTesterCloseButton',
      icon: Icons.close,
      widget: ManualWidgetTesterCloseButton(
        themeSettings: widget.themeSettings,
        onPressed: () => print('closed'),
      ),
    ));
    
    _onMouseCursorOverrideChangedStreamSubscription = _mouseCursorOverrider.registerOnMouseCursorOverrideChanged((_) {
      setState(() {});
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
              themeSettings: themeSettings,
              maxWidth: constraints.maxWidth - 128.0,
              mouseCursorOverrider: mouseCursorOverrider,
              widgetTestSessionHandler: widgetTestSessionHandler,
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
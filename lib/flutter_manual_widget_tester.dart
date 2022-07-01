library flutter_manual_widget_tester;

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/appbar.dart';
import 'package:flutter_manual_widget_tester/widgets/background.dart';
import 'package:flutter_manual_widget_tester/widgets/sidebar.dart';

class ManualWidgetTester extends StatefulWidget {
  const ManualWidgetTester({Key? key, this.themeSettings = const ManualWidgetTesterThemeSettings()}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  State<ManualWidgetTester> createState() => _ManualWidgetTesterState();
}

class _ManualWidgetTesterState extends State<ManualWidgetTester> {
  final _mouseCursorOverrider = MouseCursorOverrider();
  
  @override
  Widget build(BuildContext context) {
    _mouseCursorOverrider.setSetStateFunction(setState);
    
    print(_mouseCursorOverrider.currentMouseCursor);
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
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final MouseCursorOverrider mouseCursorOverrider;

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
                    height: themeSettings.appbarHeight,
                    sidebarColor: themeSettings.sidebarColor,
                  ),
                  Container(),
                ],
              ),
            ),
          ]
        );
      }
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';

import 'horizontal_drag_handle.dart';
import 'running_test_sessions_list.dart';
import 'test_session_settings.dart';

class ManualWidgetTesterSidebar extends StatefulWidget {
  const ManualWidgetTesterSidebar({Key? key, required this.maxWidth, required this.mouseCursorOverrider, required this.themeSettings, required this.widgetTestSessionHandler, required this.typeEditorBuilder}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final double maxWidth;
  final MouseCursorOverrider mouseCursorOverrider;
  final WidgetTestSessionHandler widgetTestSessionHandler;
  final TypeEditorBuilder typeEditorBuilder;

  @override
  State<ManualWidgetTesterSidebar> createState() => _ManualWidgetTesterSidebarState();
}

class _ManualWidgetTesterSidebarState extends State<ManualWidgetTesterSidebar> {
  double _draggedWidth = 128.0;
  late StreamSubscription<WidgetTestSessionHandler> _widgetTestSessionsChangedStream;
  
  @override
  void initState() {
    _widgetTestSessionsChangedStream = widget.widgetTestSessionHandler.registerOnChangedCallback((_) {
      setState(() {});
    });
    
    super.initState();
  }
  
  @override
  void dispose() {
    _widgetTestSessionsChangedStream.cancel();
    
    super.dispose();
  }
  
  double _getLegalDisplayWidthFromDraggedWidth(double draggedWidth) {
    const lowerBound = 96.0;
    final upperBound = widget.maxWidth;
    
    if (lowerBound > upperBound) {
      return 0.0;
    }
    
    return draggedWidth.clamp(lowerBound, upperBound);
  }
  
  @override
  Widget build(BuildContext context) {
    final displayWidth = _getLegalDisplayWidthFromDraggedWidth(_draggedWidth);
    
    return Container(
      width: displayWidth,
      color: widget.themeSettings.sidebarColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                RunningTestSessionsList(
                  themeSettings: widget.themeSettings,
                  widgetTestSessionHandler: widget.widgetTestSessionHandler,
                ),
                ...widget.widgetTestSessionHandler.widgetTestSessions.isEmpty ? const [] : [
                  TestSessionSettings(
                    themeSettings: widget.themeSettings,
                    typeEditorBuilder: widget.typeEditorBuilder,
                    widgetTestSessionHandler: widget.widgetTestSessionHandler,
                  ),
                ],
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: HorizontalDragHandle(
              mouseCursorOverrider: widget.mouseCursorOverrider,
              onDragStart: () {
                _draggedWidth = displayWidth;
              },
              onDragUpdate: (delta) => setState(() {
                _draggedWidth += delta;
              }),
            ),
          ),
        ],
      ),
    );
  }
}

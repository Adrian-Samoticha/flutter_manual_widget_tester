import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/test_session_menu_item.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class ManualWidgetTesterSidebar extends StatefulWidget {
  const ManualWidgetTesterSidebar({Key? key, required this.maxWidth, required this.mouseCursorOverrider, required this.themeSettings, required this.widgetTestSessionHandler}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final double maxWidth;
  final MouseCursorOverrider mouseCursorOverrider;
  final WidgetTestSessionHandler widgetTestSessionHandler;

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
                ManualWidgetTesterFoldableRegion(
                  heading: 'RUNNING TEST SESSIONS',
                  themeSettings: widget.themeSettings,
                  child: Column(
                    children: _generateTestSessionColumnChildren(),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _HorizontalDragHandle(
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
  
  List<Widget> _generateTestSessionColumnChildren() {
    final enableIcons = widget.widgetTestSessionHandler.widgetTestSessions.where((element) => element.icon != null).isNotEmpty;
    
    return widget.widgetTestSessionHandler.widgetTestSessions.asMap().map((int index, WidgetTestSession session) {
      final toBeReturnedWidget = ManualWidgetTesterTestSessionMenuItem(
        widgetName: session.name,
        iconColor: session.iconColor ?? widget.themeSettings.defaultIconColor,
        icon: session.icon,
        themeSettings: widget.themeSettings,
        onSelect: () {
          widget.widgetTestSessionHandler.currentIndex = index;
        },
        onClose: () {
          widget.widgetTestSessionHandler.closeWidgetTestSession(index);
        },
        tabIndex: index,
        selectedTabIndex: widget.widgetTestSessionHandler.currentIndex,
        enableIcon: enableIcons,
      );
      
      return MapEntry(index, toBeReturnedWidget);
    }).values.toList();
  }
}

class _HorizontalDragHandle extends StatefulWidget {
  const _HorizontalDragHandle({Key? key, required this.onDragUpdate, required this.onDragStart, required this.mouseCursorOverrider}) : super(key: key);
  
  final void Function() onDragStart;
  final void Function(double) onDragUpdate;
  final MouseCursorOverrider mouseCursorOverrider;

  @override
  State<_HorizontalDragHandle> createState() => _HorizontalDragHandleState();
}

class _HorizontalDragHandleState extends State<_HorizontalDragHandle> {
  int _mouseCursorOverrideId = 0;
  bool _isBeingDragged = false;
  bool _isBeingHovered = false;
  Timer? _hoverTimer;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: MouseRegion(
        onEnter: (event) => _hoverTimer = Timer(const Duration(milliseconds: 250), () {
          setState(() {
            _isBeingHovered = true;
          });
        }),
        onExit: (event) {
          _hoverTimer?.cancel();
          setState(() {
            _isBeingHovered = false;
          });
        },
        child: GestureDetector(
          onHorizontalDragStart: (details) {
            _mouseCursorOverrideId = widget.mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.resizeLeftRight);
            setState(() => _isBeingDragged = true);
            widget.onDragStart();
          },
          onHorizontalDragEnd: (details) {
            widget.mouseCursorOverrider.cancelOverride(_mouseCursorOverrideId);
            setState(() => _isBeingDragged = false);
          },
          onHorizontalDragUpdate: (details) => widget.onDragUpdate(details.delta.dx),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 6.0,
            color: _isBeingDragged || _isBeingHovered ? Colors.blue : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
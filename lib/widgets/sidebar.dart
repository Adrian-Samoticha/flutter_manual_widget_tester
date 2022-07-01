import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          _mouseCursorOverrideId = widget.mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.resizeLeftRight);
          widget.onDragStart();
        },
        onHorizontalDragEnd: (details) {
          widget.mouseCursorOverrider.cancelOverride(_mouseCursorOverrideId);
        },
        onHorizontalDragUpdate: (details) => widget.onDragUpdate(details.delta.dx),
        child: Container(
          width: 6.0,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class ManualWidgetTesterSidebar extends StatefulWidget {
  const ManualWidgetTesterSidebar({Key? key, required this.sidebarColor, required this.maxWidth, required this.mouseCursorOverrider}) : super(key: key);
  
  final Color sidebarColor;
  final double maxWidth;
  final MouseCursorOverrider mouseCursorOverrider;

  @override
  State<ManualWidgetTesterSidebar> createState() => _ManualWidgetTesterSidebarState();
}

class _ManualWidgetTesterSidebarState extends State<ManualWidgetTesterSidebar> {
  double _draggedWidth = 128.0;
  
  @override
  Widget build(BuildContext context) {
    final displayWidth = _draggedWidth.clamp(96.0, widget.maxWidth - 64.0);
    
    return Container(
      width: displayWidth,
      color: widget.sidebarColor,
      child: Row(
        children: [
          const Spacer(),
          _HorizontalDragHandle(
            mouseCursorOverrider: widget.mouseCursorOverrider,
            onDragStart: () {
              _draggedWidth = displayWidth;
            },
            onDragUpdate: (delta) => setState(() {
              _draggedWidth += delta;
            }),
          ),
        ],
      ),
    );
  }
}
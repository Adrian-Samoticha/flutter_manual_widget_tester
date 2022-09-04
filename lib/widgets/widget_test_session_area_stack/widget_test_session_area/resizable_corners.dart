import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';

class ResizableCorners extends StatefulWidget {
  final double width;
  final double height;
  final void Function() onHorizontalDragStart;
  final void Function(double) onHorizontalDragUpdate;
  final void Function() onVerticalDragStart;
  final void Function(double) onVerticalDragUpdate;
  final MouseCursorOverrider mouseCursorOverrider;

  const ResizableCorners({Key? key, required this.width, required this.height, required this.onHorizontalDragStart, required this.onHorizontalDragUpdate, required this.onVerticalDragStart, required this.onVerticalDragUpdate, required this.mouseCursorOverrider}) : super(key: key);

  @override
  State<ResizableCorners> createState() => _ResizableCornersState();
}

class _ResizableCornersState extends State<ResizableCorners> {
  int _mouseCursorOverrideId = 0;
  bool _isBeingDragged = false;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildResizeHandle(isRight: false, isBottom: false),
        _buildResizeHandle(isRight: true, isBottom: false),
        _buildResizeHandle(isRight: false, isBottom: true),
        _buildResizeHandle(isRight: true, isBottom: true),
      ],
    );
  }

  Widget _buildResizeHandle({required bool isRight, required bool isBottom}) {
    final mouseCursor = _getMouseCursorForCorner(isRight: isRight, isBottom: isBottom, isMouseButtonDown: _isBeingDragged);
    
    return Center(
      child: Transform.translate(
        offset: Offset(
          (isRight ? 0.5 : -0.5) * (widget.width + 6.0),
          (isBottom ? 0.5 : -0.5) * (widget.height + 6.0)
        ),
        child: MouseRegion(
          cursor: mouseCursor,
          child: GestureDetector(
            onPanStart: (_) {
              _mouseCursorOverrideId = widget.mouseCursorOverrider.overrideMouseCursor(_getMouseCursorForCorner(isRight: isRight, isBottom: isBottom, isMouseButtonDown: true));
              _isBeingDragged = true;
              widget.onHorizontalDragStart();
              widget.onVerticalDragStart();
            },
            onPanUpdate: (details) {
              widget.onHorizontalDragUpdate((isRight ? 2 : -2) * details.delta.dx);
              widget.onVerticalDragUpdate((isBottom ? 2 : -2) * details.delta.dy);
            },
            onPanEnd: (_) {
              widget.mouseCursorOverrider.cancelOverride(_mouseCursorOverrideId);
              _isBeingDragged = false;
            },
            child: Container(
              width: 6.0,
              height: 6.0,
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  MouseCursor _getMouseCursorForCorner({required bool isRight, required bool isBottom, bool isMouseButtonDown = false}) {
    if (widget.mouseCursorOverrider.isOverrideActive) {
      return MouseCursor.defer;
    }
    
    if (Platform.isMacOS) {
      return isMouseButtonDown ? SystemMouseCursors.grabbing : SystemMouseCursors.grab;
    }
    
    switch (isRight) {
      case false: return isBottom ? SystemMouseCursors.resizeUpRightDownLeft : SystemMouseCursors.resizeUpLeftDownRight;
      case true: return isBottom ? SystemMouseCursors.resizeUpLeftDownRight : SystemMouseCursors.resizeUpRightDownLeft;
    }
    
    return MouseCursor.defer;
  }
}

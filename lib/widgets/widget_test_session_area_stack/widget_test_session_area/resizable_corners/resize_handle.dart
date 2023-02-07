import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider.dart';

class ResizeHandle extends StatefulWidget {
  final bool isRight;
  final bool isBottom;
  final double width;
  final double height;
  final void Function() onHorizontalDragStart;
  final void Function(double) onHorizontalDragUpdate;
  final void Function() onVerticalDragStart;
  final void Function(double) onVerticalDragUpdate;

  const ResizeHandle({
    super.key,
    required this.isRight,
    required this.isBottom,
    required this.width,
    required this.height,
    required this.onHorizontalDragStart,
    required this.onHorizontalDragUpdate,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
  });

  @override
  State<ResizeHandle> createState() => _ResizeHandleState();
}

class _ResizeHandleState extends State<ResizeHandle> {
  int _mouseCursorOverrideId = 0;
  bool _isBeingDragged = false;

  MouseCursor _getMouseCursorForCorner({
    required bool isRight,
    required bool isBottom,
    bool isMouseButtonDown = false,
  }) {
    if (MouseCursorOverrider.of(context).isOverrideActive) {
      return MouseCursor.defer;
    }

    if (Platform.isMacOS) {
      return isMouseButtonDown
          ? SystemMouseCursors.grabbing
          : SystemMouseCursors.grab;
    }

    switch (isRight) {
      case false:
        return isBottom
            ? SystemMouseCursors.resizeUpRightDownLeft
            : SystemMouseCursors.resizeUpLeftDownRight;
      case true:
        return isBottom
            ? SystemMouseCursors.resizeUpLeftDownRight
            : SystemMouseCursors.resizeUpRightDownLeft;
    }

    return MouseCursor.defer;
  }

  @override
  Widget build(BuildContext context) {
    final mouseCursor = _getMouseCursorForCorner(
      isRight: widget.isRight,
      isBottom: widget.isBottom,
      isMouseButtonDown: _isBeingDragged,
    );

    return Center(
      child: Transform.translate(
        offset: Offset(
          (widget.isRight ? 0.5 : -0.5) * (widget.width + 6.0),
          (widget.isBottom ? 0.5 : -0.5) * (widget.height + 6.0),
        ),
        child: MouseRegion(
          cursor: mouseCursor,
          child: GestureDetector(
            onPanStart: (_) {
              _mouseCursorOverrideId =
                  MouseCursorOverrider.of(context).overrideMouseCursor(
                _getMouseCursorForCorner(
                  isRight: widget.isRight,
                  isBottom: widget.isBottom,
                  isMouseButtonDown: true,
                ),
              );
              _isBeingDragged = true;
              widget.onHorizontalDragStart();
              widget.onVerticalDragStart();
            },
            onPanUpdate: (DragUpdateDetails details) {
              var horizontalDelta =
                  (widget.isRight ? 2.0 : -2.0) * details.delta.dx;
              widget.onHorizontalDragUpdate(horizontalDelta);

              var verticalDelta =
                  (widget.isBottom ? 2.0 : -2.0) * details.delta.dy;
              widget.onVerticalDragUpdate(verticalDelta);
            },
            onPanEnd: (_) {
              MouseCursorOverrider.of(context)
                  .cancelOverride(_mouseCursorOverrideId);
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
}

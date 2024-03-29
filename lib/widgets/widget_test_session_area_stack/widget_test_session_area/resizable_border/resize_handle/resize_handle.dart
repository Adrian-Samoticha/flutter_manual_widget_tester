import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider.dart';

import 'dotted_line.dart';

class ResizeHandle extends StatefulWidget {
  const ResizeHandle({
    super.key,
    required this.isLeft,
    required this.isVertical,
    required this.size,
    required this.oppositeSize,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.zoom,
  });

  final bool isLeft;
  final bool isVertical;
  final double size;
  final double oppositeSize;
  final void Function() onDragStart;
  final void Function(double) onDragUpdate;
  final double zoom;

  @override
  State<ResizeHandle> createState() => _ResizeHandleState();
}

class _ResizeHandleState extends State<ResizeHandle> {
  int _mouseCursorOverrideId = 0;

  MouseCursor _getMouseCursor() {
    if (MouseCursorOverrider.of(context).isOverrideActive) {
      return MouseCursor.defer;
    }

    return widget.isVertical
        ? SystemMouseCursors.resizeUpDown
        : SystemMouseCursors.resizeLeftRight;
  }

  @override
  Widget build(BuildContext context) {
    final mouseCursor = _getMouseCursor();

    return MouseRegion(
      cursor: mouseCursor,
      child: GestureDetector(
        onHorizontalDragStart: (_) {
          _mouseCursorOverrideId =
              MouseCursorOverrider.of(context).overrideMouseCursor(mouseCursor);
          widget.onDragStart();
        },
        onHorizontalDragUpdate: (details) =>
            widget.onDragUpdate((widget.isLeft ? -2 : 2) * details.delta.dx),
        onHorizontalDragEnd: (_) {
          MouseCursorOverrider.of(context)
              .cancelOverride(_mouseCursorOverrideId);
        },
        child: SizedBox(
          width: 6.0,
          child: SizedBox.expand(
            child: DottedLine(
              color: ManualWidgetTesterTheme.of(context)
                  .widgetTestSessionAreaTheme
                  .dottedLineColor,
            ),
          ),
        ),
      ),
    );
  }
}

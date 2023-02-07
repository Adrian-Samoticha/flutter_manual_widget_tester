import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider.dart';

import 'dotted_line.dart';

class ResizableBorder extends StatefulWidget {
  const ResizableBorder({
    super.key,
    required this.isVertical,
    required this.size,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.zoom,
    required this.oppositeSize,
  });

  final bool isVertical;
  final double size;
  final double oppositeSize;
  final void Function() onDragStart;
  final void Function(double) onDragUpdate;
  final double zoom;

  @override
  State<ResizableBorder> createState() => _ResizableBorderState();
}

class _ResizableBorderState extends State<ResizableBorder> {
  int _mouseCursorOverrideId = 0;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.isVertical ? 1 : 0,
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  '${(widget.oppositeSize / widget.zoom).round()} px',
                  style: ManualWidgetTesterTheme.of(context)
                      .widgetTestSessionAreaTheme
                      .widgetSizeTextStyle,
                ),
              ),
            ),
          ),
          _buildResizeHandle(isLeft: true),
          Container(
            width: widget.size,
          ),
          _buildResizeHandle(isLeft: false),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildResizeHandle({required bool isLeft}) {
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
            widget.onDragUpdate((isLeft ? -2 : 2) * details.delta.dx),
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

  MouseCursor _getMouseCursor() {
    if (MouseCursorOverrider.of(context).isOverrideActive) {
      return MouseCursor.defer;
    }

    return widget.isVertical
        ? SystemMouseCursors.resizeUpDown
        : SystemMouseCursors.resizeLeftRight;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';

class ManualWidgetTesterWidgetTestSessionArea extends StatefulWidget {
  final MouseCursorOverrider mouseCursorOverrider;
  
  const ManualWidgetTesterWidgetTestSessionArea({Key? key, required this.mouseCursorOverrider}) : super(key: key);

  @override
  State<ManualWidgetTesterWidgetTestSessionArea> createState() => _ManualWidgetTesterWidgetTestSessionAreaState();
}

class _ManualWidgetTesterWidgetTestSessionAreaState extends State<ManualWidgetTesterWidgetTestSessionArea> {
  double _draggedWidth = 64.0;
  double _draggedHeight = 64.0;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final displayWidth = _getLegalDisplaySizeFromDraggedSize(_draggedWidth, constraints.maxWidth);
        final displayHeight = _getLegalDisplaySizeFromDraggedSize(_draggedHeight, constraints.maxHeight);
        
        return Stack(
          children: [
            _ResizableBorder(
              isVertical: false,
              size: displayWidth,
              onDragStart: () => _draggedWidth = displayWidth,
              onDragUpdate: (delta) => setState(() {
                _draggedWidth += delta;
              }),
              mouseCursorOverrider: widget.mouseCursorOverrider,
            ),
            _ResizableBorder(
              isVertical: true,
              size: displayHeight,
              onDragStart: () => _draggedHeight = displayHeight,
              onDragUpdate: (delta) => setState(() {
                _draggedHeight += delta;
              }),
              mouseCursorOverrider: widget.mouseCursorOverrider,
            ),
          ],
        );
      }
    );
  }
  
  double _getLegalDisplaySizeFromDraggedSize(double draggedSize, double maxSize) {
    const minSize = 32.0;
    final maxSizeMinusHandleSize = maxSize - 2 * 8.0;
    
    if (minSize > maxSizeMinusHandleSize) {
      return draggedSize;
    }
    
    return draggedSize.clamp(minSize, maxSizeMinusHandleSize);
  }
}

class _ResizableBorder extends StatefulWidget {
  final bool isVertical;
  final double size;
  final void Function() onDragStart;
  final void Function(double) onDragUpdate;
  final MouseCursorOverrider mouseCursorOverrider;

  const _ResizableBorder({super.key, required this.isVertical, required this.size, required this.onDragStart, required this.onDragUpdate, required this.mouseCursorOverrider});

  @override
  State<_ResizableBorder> createState() => _ResizableBorderState();
}

class _ResizableBorderState extends State<_ResizableBorder> {
  int _mouseCursorOverrideId = 0;
  
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.isVertical ? 1 : 0,
      child: Row(
        children: [
          const Spacer(),
          _generateResizeHandle(isLeft: true),
          Container(
            width: widget.size,
          ),
          _generateResizeHandle(isLeft: false),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _generateResizeHandle({required bool isLeft}) {
    final mouseCursor = widget.isVertical ? SystemMouseCursors.resizeUpDown : SystemMouseCursors.resizeLeftRight;
    
    return MouseRegion(
      cursor: mouseCursor,
      child: GestureDetector(
        onHorizontalDragStart: (_) {
          _mouseCursorOverrideId = widget.mouseCursorOverrider.overrideMouseCursor(mouseCursor);
          widget.onDragStart();
        },
        onHorizontalDragUpdate: (details) => widget.onDragUpdate((isLeft ? -2 : 2) * details.delta.dx),
        onHorizontalDragEnd: (_) {
          widget.mouseCursorOverrider.cancelOverride(_mouseCursorOverrideId);
        },
        child: SizedBox(
          width: 6.0,
          child: SizedBox.expand(
            child: CustomPaint(
              painter: _DottedLine(),
            ),
          ),
        ),
      ),
    );
  }
}

class _DottedLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, 0.5);
    
    final x = size.width * 0.5;
    for (var y = 0.0; y < size.height; y += 4.0) {
      canvas.drawCircle(Offset(x, y), 1.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
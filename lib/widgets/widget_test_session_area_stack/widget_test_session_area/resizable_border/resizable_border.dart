import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'resize_handle/resize_handle.dart';

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
          ResizeHandle(
            isLeft: true,
            isVertical: widget.isVertical,
            size: widget.size,
            oppositeSize: widget.oppositeSize,
            onDragStart: widget.onDragStart,
            onDragUpdate: widget.onDragUpdate,
            zoom: widget.zoom,
          ),
          Container(
            width: widget.size,
          ),
          ResizeHandle(
            isLeft: false,
            isVertical: widget.isVertical,
            size: widget.size,
            oppositeSize: widget.oppositeSize,
            onDragStart: widget.onDragStart,
            onDragUpdate: widget.onDragUpdate,
            zoom: widget.zoom,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

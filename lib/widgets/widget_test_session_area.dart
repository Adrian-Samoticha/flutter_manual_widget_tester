import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/zoom_controls.dart';

class ManualWidgetTesterWidgetTestSessionArea extends StatefulWidget {
  final MouseCursorOverrider mouseCursorOverrider;
  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSession widgetTestSession;
  
  const ManualWidgetTesterWidgetTestSessionArea({Key? key, required this.mouseCursorOverrider, required this.themeSettings, required this.widgetTestSession}) : super(key: key);

  @override
  State<ManualWidgetTesterWidgetTestSessionArea> createState() => _ManualWidgetTesterWidgetTestSessionAreaState();
}

class _ManualWidgetTesterWidgetTestSessionAreaState extends State<ManualWidgetTesterWidgetTestSessionArea> {
  double _draggedWidth = 480.0;
  double _draggedHeight = 640.0;
  double _zoom = 1.0;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final displayWidth = _getLegalDisplaySizeFromDraggedSize(_draggedWidth, constraints.maxWidth);
        final displayHeight = _getLegalDisplaySizeFromDraggedSize(_draggedHeight, constraints.maxHeight);
        
        return Stack(
          children: [
            _generateToBeTestedWidget(displayWidth, displayHeight),
            ..._generateResizableHandles(displayWidth, displayHeight),
            _generateZoomControls(),
          ],
        );
      }
    );
  }
  
  Widget _generateZoomControls() {
    const minZoom = 0.2;
    const maxZoom = 4.0;
    const zoomStepSize = 0.1;
    
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.all(widget.themeSettings.zoomControlsDistanceToBorder),
        child: Align(
          alignment: widget.themeSettings.zoomControlsAlignment,
          child: ManualWidgetTesterZoomControls(
            themeSettings: widget.themeSettings,
            minZoom: minZoom,
            maxZoom: maxZoom,
            onZoomInButtonPressed: () => setState(() {
              _zoom = (_zoom + zoomStepSize).clamp(minZoom, maxZoom);
            }),
            onZoomOutButtonPressed: () => setState(() {
              _zoom = (_zoom - zoomStepSize).clamp(minZoom, maxZoom);
            }),
            zoom: _zoom,
            onZoomChanged: (double newZoom) => setState(() {
              _zoom = newZoom.clamp(minZoom, maxZoom);
            }),
          ),
        ),
      ),
    );
  }

  Center _generateToBeTestedWidget(double displayWidth, double displayHeight) {
    return Center(
      child: Transform.scale(
        scale: _zoom,
        child: SizedBox(
          width: displayWidth * (1.0 / _zoom),
          height: displayHeight * (1.0 / _zoom),
          child: widget.widgetTestSession.builder(context, widget.widgetTestSession.customSettings),
        ),
      ),
    );
  }
  
  double _getLegalDisplaySizeFromDraggedSize(double draggedSize, double maxSize) {
    const minSize = 32.0;
    final maxSizeMinusHandleSize = maxSize - 2 * (8.0 + (widget.themeSettings.widgetSizeTextStyle.fontSize ?? DefaultTextStyleProvider.defaultTextStyle.fontSize!));
    
    if (minSize > maxSizeMinusHandleSize) {
      return draggedSize;
    }
    
    return draggedSize.clamp(minSize, maxSizeMinusHandleSize);
  }
  
  List<Widget> _generateResizableHandles(double displayWidth, double displayHeight) {
    return [
      _ResizableBorder(
        isVertical: false,
        size: displayWidth,
        oppositeSize: displayHeight,
        onDragStart: () => _draggedWidth = displayWidth,
        onDragUpdate: (delta) => setState(() {
          _draggedWidth += delta;
        }),
        mouseCursorOverrider: widget.mouseCursorOverrider,
        themeSettings: widget.themeSettings,
        zoom: _zoom,
      ),
      _ResizableBorder(
        isVertical: true,
        size: displayHeight,
        oppositeSize: displayWidth,
        onDragStart: () => _draggedHeight = displayHeight,
        onDragUpdate: (delta) => setState(() {
          _draggedHeight += delta;
        }),
        mouseCursorOverrider: widget.mouseCursorOverrider,
        themeSettings: widget.themeSettings,
        zoom: _zoom,
      ),
      _ResizableCorners(
        width: displayWidth,
        height: displayHeight,
        onHorizontalDragStart: () => _draggedWidth = displayWidth,
        onHorizontalDragUpdate: (delta) => setState(() {
          _draggedWidth += delta;
        }),
        onVerticalDragStart: () => _draggedHeight = displayHeight,
        onVerticalDragUpdate: (delta) => setState(() {
          _draggedHeight += delta;
        }),
        mouseCursorOverrider: widget.mouseCursorOverrider
      )
    ];
  }
}

class _ResizableBorder extends StatefulWidget {
  final bool isVertical;
  final double size;
  final double oppositeSize;
  final void Function() onDragStart;
  final void Function(double) onDragUpdate;
  final MouseCursorOverrider mouseCursorOverrider;
  final ManualWidgetTesterThemeSettings themeSettings;
  final double zoom;

  const _ResizableBorder({required this.isVertical, required this.size, required this.onDragStart, required this.onDragUpdate, required this.mouseCursorOverrider, required this.themeSettings, required this.zoom, required this.oppositeSize});

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
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  '${(widget.oppositeSize / widget.zoom).round()} px',
                  style: widget.themeSettings.widgetSizeTextStyle
                ),
              ),
            ),
          ),
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
    final mouseCursor = _getMouseCursor();
    
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
              painter: _DottedLine(widget.themeSettings.dottedLineColor),
            ),
          ),
        ),
      ),
    );
  }
  
  MouseCursor _getMouseCursor() {
    if (widget.mouseCursorOverrider.isOverrideActive) {
      return MouseCursor.defer;
    }
    
    return widget.isVertical ? SystemMouseCursors.resizeUpDown : SystemMouseCursors.resizeLeftRight;
  }
}

class _DottedLine extends CustomPainter {
  final Color dottedLineColor;

  _DottedLine(this.dottedLineColor);
  
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = dottedLineColor;
    
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

class _ResizableCorners extends StatefulWidget {
  final double width;
  final double height;
  final void Function() onHorizontalDragStart;
  final void Function(double) onHorizontalDragUpdate;
  final void Function() onVerticalDragStart;
  final void Function(double) onVerticalDragUpdate;
  final MouseCursorOverrider mouseCursorOverrider;

  const _ResizableCorners({required this.width, required this.height, required this.onHorizontalDragStart, required this.onHorizontalDragUpdate, required this.onVerticalDragStart, required this.onVerticalDragUpdate, required this.mouseCursorOverrider});

  @override
  State<_ResizableCorners> createState() => _ResizableCornersState();
}

class _ResizableCornersState extends State<_ResizableCorners> {
  int _mouseCursorOverrideId = 0;
  bool _isBeingDragged = false;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _generateResizeHandle(isRight: false, isBottom: false),
        _generateResizeHandle(isRight: true, isBottom: false),
        _generateResizeHandle(isRight: false, isBottom: true),
        _generateResizeHandle(isRight: true, isBottom: true),
      ],
    );
  }

  Widget _generateResizeHandle({required bool isRight, required bool isBottom}) {
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

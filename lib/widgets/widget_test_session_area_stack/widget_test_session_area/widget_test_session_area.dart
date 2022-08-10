import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';

import 'resizable_border/resizable_border.dart';
import 'resizable_corners.dart';
import 'zoom_controls.dart';

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
      ResizableBorder(
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
      ResizableBorder(
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
      ResizableCorners(
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

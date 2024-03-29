import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_generic_settings.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';

import 'resizable_border/resizable_border.dart';
import 'resizable_corners/resizable_corners.dart';
import 'zoom_controls.dart';

class ManualWidgetTesterWidgetTestSessionArea extends StatefulWidget {
  const ManualWidgetTesterWidgetTestSessionArea({
    super.key,
    required this.widgetTestSession,
  });

  final WidgetTestSession widgetTestSession;

  @override
  State<ManualWidgetTesterWidgetTestSessionArea> createState() =>
      _ManualWidgetTesterWidgetTestSessionAreaState();
}

class _ManualWidgetTesterWidgetTestSessionAreaState
    extends State<ManualWidgetTesterWidgetTestSessionArea> {
  late StreamSubscription<WidgetTestSessionGenericSettings>
      _genericSettingsChangedStreamSubscription;
  double _draggedWidth = 480.0;
  double _draggedHeight = 640.0;
  double _zoom = 1.0;

  @override
  void initState() {
    _genericSettingsChangedStreamSubscription = widget
        .widgetTestSession.genericSettings
        .registerOnChangedCallback((_) => setState(() {}));

    super.initState();
  }

  Widget _buildZoomControls() {
    const minZoom = 0.2;
    const maxZoom = 4.0;
    const zoomStepSize = 0.1;

    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.all(ManualWidgetTesterTheme.of(context)
            .zoomControlsTheme
            .distanceToBorder),
        child: Align(
          alignment:
              ManualWidgetTesterTheme.of(context).zoomControlsTheme.alignment,
          child: ManualWidgetTesterZoomControls(
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
    final testSession = widget.widgetTestSession;
    final customSettings = testSession.customSettings;
    final genericSettings = testSession.genericSettings;

    return Center(
      child: Transform.scale(
        scale: _zoom,
        child: SizedBox(
          width: displayWidth * (1.0 / _zoom),
          height: displayHeight * (1.0 / _zoom),
          child: DefaultTextStyle(
            style: genericSettings.defaultTextStyle,
            child: MediaQuery(
              data: genericSettings.mediaQueryData,
              child: widget.widgetTestSession.builder(context, customSettings),
            ),
          ),
        ),
      ),
    );
  }

  double _getLegalDisplaySizeFromDraggedSize(
    double draggedSize,
    double maxSize,
  ) {
    const minSize = 32.0;
    final maxSizeMinusHandleSize = maxSize -
        2 *
            (8.0 +
                (ManualWidgetTesterTheme.of(context)
                        .widgetTestSessionAreaTheme
                        .widgetSizeTextStyle
                        .fontSize ??
                    DefaultTextStyleProvider.defaultTextStyle.fontSize!));

    if (minSize > maxSizeMinusHandleSize) {
      return draggedSize;
    }

    return draggedSize.clamp(minSize, maxSizeMinusHandleSize);
  }

  List<Widget> _generateResizableHandles(
    double displayWidth,
    double displayHeight,
  ) {
    return [
      ResizableBorder(
        isVertical: false,
        size: displayWidth,
        oppositeSize: displayHeight,
        onDragStart: () => _draggedWidth = displayWidth,
        onDragUpdate: (delta) => setState(() {
          _draggedWidth += delta;
        }),
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
      ),
    ];
  }

  @override
  void dispose() {
    _genericSettingsChangedStreamSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final displayWidth = _getLegalDisplaySizeFromDraggedSize(
        _draggedWidth,
        constraints.maxWidth,
      );
      final displayHeight = _getLegalDisplaySizeFromDraggedSize(
        _draggedHeight,
        constraints.maxHeight,
      );

      return Stack(
        children: [
          _generateToBeTestedWidget(displayWidth, displayHeight),
          ..._generateResizableHandles(displayWidth, displayHeight),
          _buildZoomControls(),
        ],
      );
    });
  }
}

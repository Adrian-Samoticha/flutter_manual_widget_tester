import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';

class HorizontalDragHandle extends StatefulWidget {
  const HorizontalDragHandle(
      {Key? key,
      required this.themeSettings,
      required this.onDragUpdate,
      required this.onDragStart,
      required this.mouseCursorOverrider})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final void Function() onDragStart;
  final void Function(double) onDragUpdate;
  final MouseCursorOverrider mouseCursorOverrider;

  @override
  State<HorizontalDragHandle> createState() => _HorizontalDragHandleState();
}

class _HorizontalDragHandleState extends State<HorizontalDragHandle> {
  int _mouseCursorOverrideId = 0;
  bool _isBeingDragged = false;
  bool _isBeingHovered = false;
  Timer? _hoverTimer;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: MouseRegion(
        onEnter: (_) => _hoverTimer = Timer(
            widget.themeSettings.dragHandleTheme.timeUntilDragHandleAppears,
            () {
          setState(() {
            _isBeingHovered = true;
          });
        }),
        onExit: (_) {
          _hoverTimer?.cancel();
          setState(() {
            _isBeingHovered = false;
          });
        },
        child: GestureDetector(
          onHorizontalDragStart: (_) {
            _mouseCursorOverrideId = widget.mouseCursorOverrider
                .overrideMouseCursor(SystemMouseCursors.resizeLeftRight);
            setState(() => _isBeingDragged = true);
            widget.onDragStart();
          },
          onHorizontalDragEnd: (_) {
            widget.mouseCursorOverrider.cancelOverride(_mouseCursorOverrideId);
            setState(() => _isBeingDragged = false);
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) =>
              widget.onDragUpdate(details.delta.dx),
          child: AnimatedContainer(
            duration: widget
                .themeSettings.dragHandleTheme.dragHandleChangeOpacityDuration,
            width: widget.themeSettings.dragHandleTheme.dragHandleSize,
            color: _isBeingDragged || _isBeingHovered
                ? widget.themeSettings.dragHandleTheme.dragHandleColor
                : Colors.transparent,
          ),
        ),
      ),
    );
  }
}

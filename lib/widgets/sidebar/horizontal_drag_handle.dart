import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider.dart';

class HorizontalDragHandle extends StatefulWidget {
  const HorizontalDragHandle({
    super.key,
    required this.onDragUpdate,
    required this.onDragStart,
  });

  final void Function() onDragStart;
  final void Function(double) onDragUpdate;

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
          ManualWidgetTesterTheme.of(context)
              .dragHandleTheme
              .timeUntilDragHandleAppears,
          () {
            setState(() {
              _isBeingHovered = true;
            });
          },
        ),
        onExit: (_) {
          _hoverTimer?.cancel();
          setState(() {
            _isBeingHovered = false;
          });
        },
        child: GestureDetector(
          onHorizontalDragStart: (_) {
            _mouseCursorOverrideId = MouseCursorOverrider.of(context)
                .overrideMouseCursor(SystemMouseCursors.resizeLeftRight);
            setState(() => _isBeingDragged = true);
            widget.onDragStart();
          },
          onHorizontalDragEnd: (_) {
            MouseCursorOverrider.of(context)
                .cancelOverride(_mouseCursorOverrideId);
            setState(() => _isBeingDragged = false);
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) =>
              widget.onDragUpdate(details.delta.dx),
          child: AnimatedContainer(
            duration: ManualWidgetTesterTheme.of(context)
                .dragHandleTheme
                .opacityChangeDuration,
            width: ManualWidgetTesterTheme.of(context).dragHandleTheme.size,
            color: _isBeingDragged || _isBeingHovered
                ? ManualWidgetTesterTheme.of(context).dragHandleTheme.color
                : ManualWidgetTesterTheme.of(context)
                    .dragHandleTheme
                    .color
                    .withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}

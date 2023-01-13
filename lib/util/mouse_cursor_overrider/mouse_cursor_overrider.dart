import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider_controller.dart';

import 'mouse_cursor_overrider_inherited_widget.dart';

class MouseCursorOverrider extends StatefulWidget {
  /// A widget that allows the current mouse cursor to be overridden.
  ///
  /// [MouseCursorOverrider] is a class that allows you to override the current
  /// mouse cursor while a widget is being dragged. This is useful in situations
  /// where user-resizable widgets are implemented using a [MouseRegion], as the
  /// cursor may lag behind the widget during a drag, causing the cursor to
  /// return to the default system cursor.
  ///
  /// To use [MouseCursorOverrider], wrap your entire app in an instance of the
  /// class. You can then override the cursor within a widget as follows:
  ///
  /// ```dart
  /// _mouseCursorOverrideId = MouseCursorOverrider.of(context)
  ///           .overrideMouseCursor(SystemMouseCursors.resizeLeftRight);
  /// ```
  ///
  /// It is important to store the ID of the mouse cursor override, as it is
  /// needed to cancel the override once the drag has finished:
  ///
  /// ```dart
  /// MouseCursorOverrider.of(context)
  ///           .cancelOverride(_mouseCursorOverrideId);
  /// ```
  ///
  /// **Warning:** [MouseRegion]s will still override the mouse cursor while
  /// being hovered over, even when a mouse cursor override is active. For this
  /// reason, it is recommended to set their [cursor] to [MouseCursor.defer]
  /// while a mouse cursor override is active. You can check if an override is
  /// currently active using the
  /// [MouseCursorOverriderController.isOverrideActive] method:
  ///
  /// ```dart
  /// MouseCursorOverrider.of(context).isOverrideActive
  /// ```
  const MouseCursorOverrider({super.key, this.child});

  final Widget? child;

  static MouseCursorOverriderController of(BuildContext context) =>
      MouseCursorOverriderInheritedWidget.of(context);

  @override
  State<MouseCursorOverrider> createState() => _MouseCursorOverriderState();
}

class _MouseCursorOverriderState extends State<MouseCursorOverrider> {
  final MouseCursorOverriderController _controller =
      MouseCursorOverriderController();
  late StreamSubscription<MouseCursorOverriderController> _onChangedCallback;

  @override
  void initState() {
    _onChangedCallback = _controller.registerOnMouseCursorOverrideChanged((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _onChangedCallback.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseCursorOverriderInheritedWidget(
      controller: _controller,
      child: MouseRegion(
        cursor: _controller.currentMouseCursor,
        child: widget.child,
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider_controller.dart';

import 'mouse_cursor_overrider_inherited_widget.dart';

class MouseCursorOverrider extends StatefulWidget {
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

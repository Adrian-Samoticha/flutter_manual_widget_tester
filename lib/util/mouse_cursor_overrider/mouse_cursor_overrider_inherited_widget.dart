import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider_controller.dart';

class MouseCursorOverriderInheritedWidget extends InheritedWidget {
  const MouseCursorOverriderInheritedWidget({
    super.key,
    required this.controller,
    required super.child,
  }) : super();

  static MouseCursorOverriderController of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<
          MouseCursorOverriderInheritedWidget>()!
      .controller;

  final MouseCursorOverriderController controller;

  @override
  bool updateShouldNotify(MouseCursorOverriderInheritedWidget oldWidget) =>
      true;
}

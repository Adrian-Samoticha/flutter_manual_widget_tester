import 'package:flutter/rendering.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('mouse cursor overrider controller basic functionality',
      (tester) async {
    final mouseCursorOverrider = MouseCursorOverriderController();

    expect(mouseCursorOverrider.currentMouseCursor, MouseCursor.defer);

    final moveId =
        mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.move);
    expect(mouseCursorOverrider.currentMouseCursor, SystemMouseCursors.move);

    final copyId =
        mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.copy);
    expect(mouseCursorOverrider.currentMouseCursor, SystemMouseCursors.copy);

    mouseCursorOverrider.cancelOverride(copyId);
    expect(mouseCursorOverrider.currentMouseCursor, SystemMouseCursors.move);

    mouseCursorOverrider.cancelOverride(moveId);
    expect(mouseCursorOverrider.currentMouseCursor, MouseCursor.defer);
  });

  testWidgets(
      'mouse cursor overrider controller on override changed callback (override mouse '
      'cursor)', (tester) async {
    final mouseCursorOverrider = MouseCursorOverriderController();

    mouseCursorOverrider.registerOnMouseCursorOverrideChanged(
        expectAsync1((value) => value == mouseCursorOverrider));

    mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.alias);
  });

  testWidgets(
      'mouse cursor overrider controller on override changed callback (cancel override)',
      (tester) async {
    final mouseCursorOverrider = MouseCursorOverriderController();

    final overrideId =
        mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.alias);

    mouseCursorOverrider.registerOnMouseCursorOverrideChanged(
        expectAsync1((value) => value == mouseCursorOverrider));

    mouseCursorOverrider.cancelOverride(overrideId);
  });
}

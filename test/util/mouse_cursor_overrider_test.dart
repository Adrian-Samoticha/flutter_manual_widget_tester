import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('mouse cursor overrider basic functionality', (tester) async {
    final mouseCursorOverrider = MouseCursorOverrider();
    
    expect(mouseCursorOverrider.currentMouseCursor, MouseCursor.defer);
    
    final moveId = mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.move);
    expect(mouseCursorOverrider.currentMouseCursor, SystemMouseCursors.move);
    
    final copyId = mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.copy);
    expect(mouseCursorOverrider.currentMouseCursor, SystemMouseCursors.copy);
    
    mouseCursorOverrider.cancelOverride(copyId);
    expect(mouseCursorOverrider.currentMouseCursor, SystemMouseCursors.move);
    
    mouseCursorOverrider.cancelOverride(moveId);
    expect(mouseCursorOverrider.currentMouseCursor, MouseCursor.defer);
  });
}
import 'dart:async';

import 'package:flutter/rendering.dart';

class _MouseCursorOverride {
  final MouseCursor mouseCursor;
  final int id;

  _MouseCursorOverride(this.mouseCursor, this.id);
}

class _MouseCursorOverrideGenerator {
  int _lastId = 0;

  _MouseCursorOverride generateMouseCursorOverride(MouseCursor mouseCursor) {
    return _MouseCursorOverride(mouseCursor, _lastId++);
  }
}

class MouseCursorOverrider {
  final List<_MouseCursorOverride> _overrides = [];
  final mouseCursorOverrideGenerator = _MouseCursorOverrideGenerator();

  final StreamController<MouseCursorOverrider>
      _onMouseCursorOverrideChangedStream = StreamController.broadcast();

  StreamSubscription<MouseCursorOverrider> registerOnMouseCursorOverrideChanged(
      void Function(MouseCursorOverrider) callback) {
    return _onMouseCursorOverrideChangedStream.stream.listen(callback);
  }

  int overrideMouseCursor(MouseCursor mouseCursor) {
    _onMouseCursorOverrideChangedStream.add(this);

    final newOverride =
        mouseCursorOverrideGenerator.generateMouseCursorOverride(mouseCursor);
    _overrides.add(newOverride);
    return newOverride.id;
  }

  void cancelOverride(int id) {
    _onMouseCursorOverrideChangedStream.add(this);

    _overrides.removeWhere((element) => element.id == id);
  }

  MouseCursor get currentMouseCursor {
    if (_overrides.isEmpty) {
      return MouseCursor.defer;
    }

    return _overrides.last.mouseCursor;
  }

  bool get isOverrideActive => _overrides.isNotEmpty;
}

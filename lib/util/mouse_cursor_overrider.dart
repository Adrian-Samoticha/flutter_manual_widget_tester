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
  
  void Function(void Function())? _setStateFunction;
  
  void setSetStateFunction(Function(void Function()) setStateFunction) {
    _setStateFunction = setStateFunction;
  }
  
  int overrideMouseCursor(MouseCursor mouseCursor) {
    if (_setStateFunction != null) {
      _setStateFunction!(() {});
    }
    
    final newOverride = mouseCursorOverrideGenerator.generateMouseCursorOverride(mouseCursor);
    _overrides.add(newOverride);
    return newOverride.id;
  }
  
  void cancelOverride(int id) {
    if (_setStateFunction != null) {
      _setStateFunction!(() {});
    }
    
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
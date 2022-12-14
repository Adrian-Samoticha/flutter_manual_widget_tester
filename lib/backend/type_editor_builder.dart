import 'package:flutter/widgets.dart';

class TypeEditorBuilder {
  final Map<Type, dynamic> _typeToEditorBuilder = {};

  bool hasEditorBuilderInstalledForType(Type type) {
    return _typeToEditorBuilder.containsKey(type);
  }

  Widget buildEditor<T>(
      String name, Type type, T value, void Function(T) onValueChanged) {
    assert(_typeToEditorBuilder.containsKey(type),
        'No editor builder for type $T installed.');

    final builder = _typeToEditorBuilder[type]!;
    return builder(name, value, onValueChanged as void Function(dynamic));
  }

  void installEditorBuilder<T>(
      Widget Function(
              String settingName, T currentValue, void Function(T) onChanged)
          builder) {
    _typeToEditorBuilder[T] = builder;
  }
}

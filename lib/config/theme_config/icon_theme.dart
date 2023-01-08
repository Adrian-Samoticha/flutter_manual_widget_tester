import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterIconTheme extends Equatable {
  /// The default color of the icons of the open test sessions.
  final Color defaultIconColor;

  const ManualWidgetTesterIconTheme({
    this.defaultIconColor = const Color.fromRGBO(64, 167, 255, 1.0),
  });

  @override
  List<Object?> get props => [
        defaultIconColor,
      ];
}

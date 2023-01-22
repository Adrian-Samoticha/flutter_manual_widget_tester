import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterCreateTestSessionButtonTheme extends Equatable {
  /// The padding of the “create test session” button.
  final EdgeInsets createTestSessionButtonPadding;

  const ManualWidgetTesterCreateTestSessionButtonTheme({
    this.createTestSessionButtonPadding = const EdgeInsets.all(6.5),
  });

  @override
  List<Object?> get props => [
        createTestSessionButtonPadding,
      ];

  static ManualWidgetTesterCreateTestSessionButtonTheme
      fromThemeGeneratorParameters(ThemeGeneratorParameters parameters) {
    return const ManualWidgetTesterCreateTestSessionButtonTheme();
  }
}

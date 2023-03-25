import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class CreateTestSessionButtonTheme extends Equatable {
  const CreateTestSessionButtonTheme({
    this.padding = const EdgeInsets.all(6.5),
  });

  /// The padding of the “create test session” button.
  final EdgeInsets padding;

  @override
  List<Object?> get props => [
        padding,
      ];

  static CreateTestSessionButtonTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return CreateTestSessionButtonTheme(
      padding: _getPaddingFromLayout(parameters.layout),
    );
  }

  static EdgeInsets _getPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(5.0);
      case Layout.normal:
        return const EdgeInsets.all(6.5);
      case Layout.cozy:
        return const EdgeInsets.all(8.0);
    }
  }
}

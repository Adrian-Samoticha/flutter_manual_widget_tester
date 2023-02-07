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
    return const CreateTestSessionButtonTheme();
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class CreateTestSessionButtonTheme extends Equatable {
  /// The padding of the “create test session” button.
  final EdgeInsets padding;

  const CreateTestSessionButtonTheme({
    this.padding = const EdgeInsets.all(6.5),
  });

  @override
  List<Object?> get props => [
        padding,
      ];

  static CreateTestSessionButtonTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const CreateTestSessionButtonTheme();
  }
}

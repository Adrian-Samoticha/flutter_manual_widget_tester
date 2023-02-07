import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class CustomSettingsTheme extends Equatable {
  const CustomSettingsTheme({
    this.padding = const EdgeInsets.all(8.0),
  });

  /// The padding of a custom settings widget.
  final EdgeInsets padding;

  @override
  List<Object?> get props => [
        padding,
      ];

  static CustomSettingsTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return CustomSettingsTheme(
      padding: _getPaddingFromLayout(parameters.layout),
    );
  }

  static EdgeInsets _getPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(6.0);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(12.0);
    }
  }
}

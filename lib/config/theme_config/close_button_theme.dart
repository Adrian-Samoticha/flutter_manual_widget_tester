import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class CloseButtonTheme extends Equatable {
  /// The box decoration of a close button's hover effect.
  final BoxDecoration hoverDecoration;

  /// The close button's color.
  final Color color;

  const CloseButtonTheme({
    this.hoverDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.2),
      borderRadius: BorderRadius.all(Radius.circular(1024.0)),
    ),
    this.color = const Color.fromRGBO(255, 255, 255, 0.9),
  });

  @override
  List<Object?> get props => [
        hoverDecoration,
        color,
      ];

  static CloseButtonTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return CloseButtonTheme(
      color: _getColorFromBrightness(parameters.brightness),
    );
  }

  static Color _getColorFromBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const Color.fromRGBO(255, 255, 255, 0.9);
      case Brightness.light:
        return const Color.fromRGBO(0, 0, 0, 0.9);
    }
  }
}

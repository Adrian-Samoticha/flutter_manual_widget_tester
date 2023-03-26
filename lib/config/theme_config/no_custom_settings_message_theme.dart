import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class NoCustomSettingsMessageTheme extends Equatable {
  const NoCustomSettingsMessageTheme({
    this.padding = const EdgeInsets.all(8.0),
    this.textStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.75),
    ),
  });

  /// The padding of the message that is displayed when a test session has no
  /// custom settings.
  final EdgeInsets padding;

  /// The text style of the message that is displayed when a test session has
  /// no custom settings.
  final TextStyle textStyle;

  @override
  List<Object?> get props => [
        padding,
        textStyle,
      ];

  static NoCustomSettingsMessageTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return NoCustomSettingsMessageTheme(
      padding: _getPadding(parameters),
      textStyle: _getTextStyle(parameters),
    );
  }

  static EdgeInsets _getPadding(ThemeGeneratorParameters parameters) {
    final layout = parameters.layout;

    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(6.0);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(12.0);
    }
  }

  static TextStyle _getTextStyle(ThemeGeneratorParameters parameters) {
    final brightness = parameters.brightness;

    if (brightness == Brightness.light) {
      return const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.75),
      );
    }

    return const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.75),
    );
  }
}

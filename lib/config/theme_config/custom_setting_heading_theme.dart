import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class CustomSettingHeadingTheme extends Equatable {
  const CustomSettingHeadingTheme({
    this.textStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.overflow = TextOverflow.ellipsis,
    this.padding = const EdgeInsets.only(bottom: 5.0),
  });

  /// The text style of a custom setting's heading.
  final TextStyle textStyle;

  /// The text overflow behavior of a custom setting's heading.
  final TextOverflow overflow;

  /// The padding of a custom setting's heading.
  final EdgeInsets padding;

  @override
  List<Object?> get props => [
        textStyle,
        overflow,
        padding,
      ];

  static CustomSettingHeadingTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return CustomSettingHeadingTheme(
      textStyle: _getTextStyle(parameters),
      padding: _getPaddingFromLayout(parameters.layout),
    );
  }

  static TextStyle _getTextStyle(ThemeGeneratorParameters parameters) {
    final brightness = parameters.brightness;
    final layout = parameters.layout;

    final color = brightness == Brightness.light
        ? const Color.fromRGBO(0, 0, 0, 0.9)
        : const Color.fromRGBO(255, 255, 255, 0.9);

    final fontSize = layout == Layout.compact
        ? 13.0
        : layout == Layout.normal
            ? 14.0
            : 16.0;

    return TextStyle(
      color: color,
      fontSize: fontSize,
    );
  }

  static EdgeInsets _getPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.only(bottom: 4.0);
      case Layout.normal:
        return const EdgeInsets.only(bottom: 5.0);
      case Layout.cozy:
        return const EdgeInsets.only(bottom: 6.0);
    }
  }
}

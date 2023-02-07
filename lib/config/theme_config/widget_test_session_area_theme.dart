import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class WidgetTestSessionAreaTheme extends Equatable {
  const WidgetTestSessionAreaTheme({
    this.dottedLineColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.widgetSizeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      fontSize: 10.0,
    ),
  });

  /// The color of the dotted lines that show the tested widget's size.
  final Color dottedLineColor;

  /// The text style in which the tested widget's size is displayed.
  final TextStyle widgetSizeTextStyle;

  @override
  List<Object?> get props => [
        dottedLineColor,
        widgetSizeTextStyle,
      ];

  static WidgetTestSessionAreaTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return const WidgetTestSessionAreaTheme();
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/multiply_saturation.dart';

import 'theme_generator/theme_generator_parameters.dart';

class IconTheme extends Equatable {
  /// The default color of the icons of the open test sessions.
  final Color defaultColor;

  const IconTheme({
    this.defaultColor = const Color.fromRGBO(64, 167, 255, 1.0),
  });

  @override
  List<Object?> get props => [
        defaultColor,
      ];

  static IconTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return IconTheme(
      defaultColor: HSLColor.fromColor(parameters.primaryColor)
          .multiplySaturation(0.95)
          .toColor(),
    );
  }
}

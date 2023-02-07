import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class EditColorDialogTheme extends Equatable {
  const EditColorDialogTheme({
    this.sizeChangeAnimationDuration = const Duration(milliseconds: 150),
    this.sizeChangeAnimationCurve = Curves.ease,
    this.elevation = 2.0,
    this.borderRadius = 2.0,
    this.colorNameTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.pickerTypeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.selectedPickerTypeColor = const Color.fromRGBO(82, 82, 82, 1.0),
    this.spacing = 4.0,
    this.runSpacing = 4.0,
    this.columnSpacing = 8.0,
  });

  /// The duration of the edit color dialog's size change animation.
  final Duration sizeChangeAnimationDuration;

  /// The animation curve of the edit color dialog's size change animation.
  final Curve sizeChangeAnimationCurve;

  /// The elevation of the edit color dialog.
  final double elevation;

  /// The border radius of the edit color dialog.
  final double borderRadius;

  /// The text style of the edit color dialog's color name.
  final TextStyle colorNameTextStyle;

  /// The text style of the edit color dialog's picker type text.
  final TextStyle pickerTypeTextStyle;

  /// The color of the selected picker type text in the edit color dialog.
  final Color selectedPickerTypeColor;

  /// The horizontal spacing between the color picker indicator items in the
  /// edit color dialog.
  final double spacing;

  /// The space between the color picker color item rows in the edit color
  /// dialog, when they need to be wrapped to multiple rows.
  final double runSpacing;

  /// Vertical spacing between items in the color picker column in the edit
  /// color dialog.
  final double columnSpacing;

  @override
  List<Object?> get props => [
        sizeChangeAnimationDuration,
        sizeChangeAnimationCurve,
        elevation,
        borderRadius,
        colorNameTextStyle,
        pickerTypeTextStyle,
        selectedPickerTypeColor,
        spacing,
        runSpacing,
        columnSpacing,
      ];

  static EditColorDialogTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return const EditColorDialogTheme();
  }
}

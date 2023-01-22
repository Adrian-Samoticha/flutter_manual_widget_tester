import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterEditColorDialogTheme extends Equatable {
  /// The duration of the edit color dialog's size change animation.
  final Duration editColorDialogSizeChangeAnimationDuration;

  /// The animation curve of the edit color dialog's size change animation.
  final Curve editColorDialogSizeChangeCurve;

  /// The elevation of the edit color dialog.
  final double editColorDialogElevation;

  /// The border radius of the edit color dialog.
  final double editColorDialogBorderRadius;

  /// The text style of the edit color dialog's color name.
  final TextStyle editColorDialogColorNameTextStyle;

  /// The text style of the edit color dialog's picker type text.
  final TextStyle editColorDialogPickerTypeTextStyle;

  /// The color of the selected picker type text in the edit color dialog.
  final Color editColorDialogSelectedPickerTypeColor;

  /// The horizontal spacing between the color picker indicator items in the
  /// edit color dialog.
  final double editColorDialogSpacing;

  /// The space between the color picker color item rows in the edit color
  /// dialog, when they need to be wrapped to multiple rows.
  final double editColorDialogRunSpacing;

  /// Vertical spacing between items in the color picker column in the edit
  /// color dialog.
  final double editColorDialogColumnSpacing;

  const ManualWidgetTesterEditColorDialogTheme({
    this.editColorDialogSizeChangeAnimationDuration =
        const Duration(milliseconds: 150),
    this.editColorDialogSizeChangeCurve = Curves.ease,
    this.editColorDialogElevation = 2.0,
    this.editColorDialogBorderRadius = 2.0,
    this.editColorDialogColorNameTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.editColorDialogPickerTypeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.editColorDialogSelectedPickerTypeColor =
        const Color.fromRGBO(82, 82, 82, 1.0),
    this.editColorDialogSpacing = 4.0,
    this.editColorDialogRunSpacing = 4.0,
    this.editColorDialogColumnSpacing = 8.0,
  });

  @override
  List<Object?> get props => [
        editColorDialogSizeChangeAnimationDuration,
        editColorDialogSizeChangeCurve,
        editColorDialogElevation,
        editColorDialogBorderRadius,
        editColorDialogColorNameTextStyle,
        editColorDialogPickerTypeTextStyle,
        editColorDialogSelectedPickerTypeColor,
        editColorDialogSpacing,
        editColorDialogRunSpacing,
        editColorDialogColumnSpacing,
      ];

  static ManualWidgetTesterEditColorDialogTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const ManualWidgetTesterEditColorDialogTheme();
  }
}

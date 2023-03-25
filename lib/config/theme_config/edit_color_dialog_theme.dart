import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

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
    return EditColorDialogTheme(
      sizeChangeAnimationDuration: _getSizeChangeAnimationDuration(parameters),
      elevation: _getElevation(parameters),
      colorNameTextStyle: _getColorNameTextStyle(parameters),
      pickerTypeTextStyle: _getPickerTypeTextStyle(parameters),
      selectedPickerTypeColor: _getSelectedPickerColor(parameters),
      spacing: _getSpacing(parameters),
      runSpacing: _getSpacing(parameters),
      columnSpacing: _getColumnSpacing(parameters),
    );
  }

  static Duration _getSizeChangeAnimationDuration(
      ThemeGeneratorParameters parameters) {
    final animationSpeed = parameters.animationSpeed;

    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 80);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 150);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 300);
    }
  }

  static double _getElevation(ThemeGeneratorParameters parameters) {
    final designLanguage = parameters.designLanguage;

    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return 2.0;
      case DesignLanguage.flat:
        return 0.0;
    }
  }

  static TextStyle _getColorNameTextStyle(
    ThemeGeneratorParameters parameters,
  ) {
    final brightness = parameters.brightness;

    if (brightness == Brightness.light) {
      return const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.9),
      );
    }

    return const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    );
  }

  static TextStyle _getPickerTypeTextStyle(
    ThemeGeneratorParameters parameters,
  ) {
    final brightness = parameters.brightness;

    if (brightness == Brightness.light) {
      return const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.9),
      );
    }

    return const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    );
  }

  static Color _getSelectedPickerColor(
    ThemeGeneratorParameters parameters,
  ) {
    final brightness = parameters.brightness;

    switch (brightness) {
      case Brightness.dark:
        return parameters.filteredBackgroundColor.lighter(8);
      case Brightness.light:
        return parameters.filteredBackgroundColor.lighter(8);
    }
  }

  static double _getSpacing(ThemeGeneratorParameters parameters) {
    final layout = parameters.layout;

    switch (layout) {
      case Layout.compact:
        return 3.0;
      case Layout.normal:
        return 4.0;
      case Layout.cozy:
        return 5.0;
    }
  }

  static double _getColumnSpacing(ThemeGeneratorParameters parameters) {
    return _getSpacing(parameters) * 2.0;
  }
}

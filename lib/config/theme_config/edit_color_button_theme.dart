import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class EditColorButtonTheme extends Equatable {
  /// The height of the edit color button.
  final double height;

  /// The box decoration of the edit color button when it is displaying a dark
  /// color.
  final BoxDecoration decorationForDarkColor;

  /// The box decoration of the edit color button when it is displaying a
  /// bright color.
  final BoxDecoration decorationForBrightColor;

  /// The border radius of the edit color button.
  final BorderRadius borderRadius;

  /// The first checkerboard color of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is
  /// displaying a transparent color.
  final Color checkerboardColor1;

  /// The second checkerboard color of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is
  /// displaying a transparent color.
  final Color checkerboardColor2;

  /// The checkerboard size of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is
  /// displaying a transparent color.
  final double checkerboardSize;

  /// The icon on the edit color button.
  final IconData icon;

  /// The color of the edit color button's icon when it is displaying a dark
  /// color.
  final Color iconColorForDarkColor;

  /// The color of the edit color button's icon when it is displaying a bright
  /// color.
  final Color iconColorForBrightColor;

  /// The shadow(s) of the edit color button's icon when it is displaying a dark
  /// color.
  final List<Shadow>? iconShadowsForDarkColor;

  /// The shadow(s) of the edit color button's icon when it is displaying a
  /// bright color.
  final List<Shadow>? iconShadowsForBrightColor;

  /// The duration of the edit color button's icon's slide in/out animation that
  /// is played when the mouse is hovered over the button.
  final Duration iconAnimationDuration;

  /// The animation curve of the edit color button's icon's slide in/out
  /// animation that is played when the mouse is hovered over the button.
  final Curve iconAnimationCurve;

  /// The text style of the edit color button when it is displaying a dark
  /// color.
  final TextStyle textStyleForDarkColor;

  /// The text style of the edit color button when it is displaying a bright
  /// color.
  final TextStyle textStyleForBrightColor;

  const EditColorButtonTheme({
    this.height = 28.0,
    this.decorationForDarkColor = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 3.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0.0, 1.0),
        ),
      ],
    ),
    this.decorationForBrightColor = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 3.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0.0, 1.0),
        ),
      ],
    ),
    this.borderRadius = const BorderRadius.all(Radius.circular(5.0)),
    this.checkerboardColor1 = const Color.fromRGBO(255, 255, 255, 1.0),
    this.checkerboardColor2 = const Color.fromRGBO(192, 192, 192, 1.0),
    this.checkerboardSize = 14.0,
    this.icon = Icons.colorize_rounded,
    this.iconColorForDarkColor = const Color.fromRGBO(255, 255, 255, 0.9),
    this.iconColorForBrightColor = const Color.fromRGBO(0, 0, 0, 0.7),
    this.iconShadowsForDarkColor = const [
      Shadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.5),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.iconShadowsForBrightColor,
    this.iconAnimationDuration = const Duration(milliseconds: 250),
    this.iconAnimationCurve = Curves.ease,
    this.textStyleForDarkColor = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      shadows: [
        Shadow(
          blurRadius: 2.0,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          offset: Offset(0.0, 1.0),
        ),
      ],
    ),
    this.textStyleForBrightColor = const TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.9),
    ),
  });

  @override
  List<Object?> get props => [
        height,
        decorationForDarkColor,
        decorationForBrightColor,
        borderRadius,
        checkerboardColor1,
        checkerboardColor2,
        checkerboardSize,
        icon,
        iconColorForDarkColor,
        iconColorForBrightColor,
        iconShadowsForDarkColor,
        iconShadowsForBrightColor,
        iconAnimationDuration,
        iconAnimationCurve,
        textStyleForDarkColor,
        textStyleForBrightColor,
      ];

  static EditColorButtonTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const EditColorButtonTheme();
  }
}

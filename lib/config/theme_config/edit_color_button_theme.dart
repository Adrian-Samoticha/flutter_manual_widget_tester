import 'package:flutter/material.dart';

class ManualWidgetTesterEditColorButtonTheme {
  /// The height of the edit color button.
  final double editColorButtonHeight;

  /// The box decoration of the edit color button when it is displaying a dark
  /// color.
  final BoxDecoration editColorButtonDecorationForDarkColor;

  /// The box decoration of the edit color button when it is displaying a
  /// bright color.
  final BoxDecoration editColorButtonDecorationForBrightColor;

  /// The border radius of the edit color button.
  final BorderRadius editColorButtonBorderRadius;

  /// The first checkerboard color of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is
  /// displaying a transparent color.
  final Color editColorButtonCheckerboardColor1;

  /// The second checkerboard color of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is
  /// displaying a transparent color.
  final Color editColorButtonCheckerboardColor2;

  /// The checkerboard size of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is
  /// displaying a transparent color.
  final double editColorButtonCheckerboardSize;

  /// The icon on the edit color button.
  final IconData editColorButtonIcon;

  /// The color of the edit color button's icon when it is displaying a dark
  /// color.
  final Color editColorButtonIconColorForDarkColor;

  /// The color of the edit color button's icon when it is displaying a bright
  /// color.
  final Color editColorButtonIconColorForBrightColor;

  /// The shadow(s) of the edit color button's icon when it is displaying a dark
  /// color.
  final List<Shadow>? editColorButtonIconShadowsForDarkColor;

  /// The shadow(s) of the edit color button's icon when it is displaying a
  /// bright color.
  final List<Shadow>? editColorButtonIconShadowsForBrightColor;

  /// The duration of the edit color button's icon's slide in/out animation that
  /// is played when the mouse is hovered over the button.
  final Duration editColorButtonIconAnimationDuration;

  /// The animation curve of the edit color button's icon's slide in/out
  /// animation that is played when the mouse is hovered over the button.
  final Curve editColorButtonIconAnimationCurve;

  /// The text style of the edit color button when it is displaying a dark
  /// color.
  final TextStyle editColorButtonTextStyleForDarkColor;

  /// The text style of the edit color button when it is displaying a bright
  /// color.
  final TextStyle editColorButtonTextStyleForBrightColor;

  const ManualWidgetTesterEditColorButtonTheme({
    this.editColorButtonHeight = 28.0,
    this.editColorButtonDecorationForDarkColor = const BoxDecoration(
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
    this.editColorButtonDecorationForBrightColor = const BoxDecoration(
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
    this.editColorButtonBorderRadius =
        const BorderRadius.all(Radius.circular(5.0)),
    this.editColorButtonCheckerboardColor1 =
        const Color.fromRGBO(255, 255, 255, 1.0),
    this.editColorButtonCheckerboardColor2 =
        const Color.fromRGBO(192, 192, 192, 1.0),
    this.editColorButtonCheckerboardSize = 14.0,
    this.editColorButtonIcon = Icons.colorize_rounded,
    this.editColorButtonIconColorForDarkColor =
        const Color.fromRGBO(255, 255, 255, 0.9),
    this.editColorButtonIconColorForBrightColor =
        const Color.fromRGBO(0, 0, 0, 0.7),
    this.editColorButtonIconShadowsForDarkColor = const [
      Shadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.5),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.editColorButtonIconShadowsForBrightColor,
    this.editColorButtonIconAnimationDuration =
        const Duration(milliseconds: 250),
    this.editColorButtonIconAnimationCurve = Curves.ease,
    this.editColorButtonTextStyleForDarkColor = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      shadows: [
        Shadow(
          blurRadius: 2.0,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          offset: Offset(0.0, 1.0),
        ),
      ],
    ),
    this.editColorButtonTextStyleForBrightColor = const TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.9),
    ),
  });
}

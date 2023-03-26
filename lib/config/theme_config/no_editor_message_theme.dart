import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class NoEditorMessageTheme extends Equatable {
  const NoEditorMessageTheme({
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.all(8.0),
    this.decoration = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 128, 0, 1.0),
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.textStyle = const TextStyle(
      color: Color.fromRGBO(255, 128, 0, 1.0),
    ),
    this.highlightedTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 192, 0, 1.0),
      fontStyle: FontStyle.italic,
    ),
  });

  /// The padding of the message that is displayed when no editor for a
  /// particular setting could be built.
  final EdgeInsets padding;

  /// The margin of the message that is displayed when no editor for a
  /// particular setting could be built.
  final EdgeInsets margin;

  /// The box decoration of the message that is displayed when no editor for a
  /// particular setting could be built.
  final BoxDecoration decoration;

  /// The text style of the message that is displayed when no editor for a
  /// particular setting could be built.
  final TextStyle textStyle;

  /// The text style of the highlighted text of the message that is displayed
  /// when no editor for a particular setting could be built.
  final TextStyle highlightedTextStyle;

  @override
  List<Object?> get props => [
        padding,
        margin,
        decoration,
        textStyle,
        highlightedTextStyle,
      ];

  static NoEditorMessageTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return NoEditorMessageTheme(
      padding: _getPadding(parameters),
      margin: _getMargin(parameters),
      decoration: _getDecoration(parameters),
      textStyle: _getTextStyle(parameters),
      highlightedTextStyle: _getHighlightedTextStyle(parameters),
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
        return const EdgeInsets.all(10.0);
    }
  }

  static EdgeInsets _getMargin(ThemeGeneratorParameters parameters) {
    return _getPadding(parameters);
  }

  static BoxDecoration _getDecoration(ThemeGeneratorParameters parameters) {
    final brightness = parameters.brightness;

    if (brightness == Brightness.light) {
      return const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(255, 128, 0, 1.0),
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      );
    }

    return const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 128, 0, 1.0),
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }

  static TextStyle _getTextStyle(ThemeGeneratorParameters parameters) {
    final brightness = parameters.brightness;

    if (brightness == Brightness.light) {
      return const TextStyle(
        color: Color.fromRGBO(255, 115, 0, 1.0),
      );
    }

    return const TextStyle(
      color: Color.fromRGBO(255, 128, 0, 1.0),
    );
  }

  static TextStyle _getHighlightedTextStyle(
    ThemeGeneratorParameters parameters,
  ) {
    final brightness = parameters.brightness;

    if (brightness == Brightness.light) {
      return const TextStyle(
        color: Color.fromRGBO(255, 12, 0, 1.0),
        fontStyle: FontStyle.italic,
      );
    }

    return const TextStyle(
      color: Color.fromRGBO(255, 192, 0, 1.0),
      fontStyle: FontStyle.italic,
    );
  }
}

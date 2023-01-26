import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class NoEditorMessageTheme extends Equatable {
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

  @override
  List<Object?> get props => [
        padding,
        margin,
        decoration,
        textStyle,
        highlightedTextStyle,
      ];

  static NoEditorMessageTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const NoEditorMessageTheme();
  }
}

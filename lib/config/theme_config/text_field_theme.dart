import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterTextFieldTheme extends Equatable {
  /// The shadow(s) of a text field.
  final List<BoxShadow> textFieldShadow;

  /// The border radius of a text field.
  final Radius textFieldBorderRadius;

  /// The color of a text field.
  final Color textFieldColor;

  /// The border color of a text field.
  final Color textFieldBorderColor;

  /// The border width of a text field.
  final double textFieldBorderWidth;

  /// The text style of a text field.
  final TextStyle textFieldTextStyle;

  /// The text style of a text field's suffix.
  final TextStyle textFieldSuffixStyle;

  /// The color of a text field's cursor.
  final Color textFieldCursorColor;

  /// The color of a text field's selection.
  final Color textFieldSelectionColor;

  /// The padding of a text field's content.
  final EdgeInsetsGeometry textFieldContentPadding;

  const ManualWidgetTesterTextFieldTheme({
    this.textFieldShadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.2),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.textFieldBorderRadius = const Radius.circular(3.0),
    this.textFieldColor = const Color.fromARGB(255, 41, 45, 53),
    this.textFieldBorderColor = const Color.fromRGBO(255, 255, 255, 0.05),
    this.textFieldBorderWidth = 1.0,
    this.textFieldTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.textFieldSuffixStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.textFieldCursorColor = const Color.fromRGBO(4, 180, 255, 1.0),
    this.textFieldSelectionColor = const Color.fromRGBO(4, 180, 255, 0.67),
    this.textFieldContentPadding = const EdgeInsets.all(8.0),
  });

  @override
  List<Object?> get props => [
        textFieldShadow,
        textFieldBorderRadius,
        textFieldColor,
        textFieldBorderColor,
        textFieldBorderWidth,
        textFieldTextStyle,
        textFieldSuffixStyle,
        textFieldCursorColor,
        textFieldSelectionColor,
        textFieldContentPadding,
      ];
}

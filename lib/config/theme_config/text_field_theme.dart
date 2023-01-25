import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

class TextFieldTheme extends Equatable {
  /// The shadow(s) of a text field.
  final List<BoxShadow> shadow;

  /// The border radius of a text field.
  final Radius borderRadius;

  /// The color of a text field.
  final Color color;

  /// The border color of a text field.
  final Color borderColor;

  /// The border width of a text field.
  final double borderWidth;

  /// The text style of a text field.
  final TextStyle textStyle;

  /// The text style of a text field's suffix.
  final TextStyle suffixStyle;

  /// The color of a text field's cursor.
  final Color cursorColor;

  /// The color of a text field's selection.
  final Color selectionColor;

  /// The padding of a text field's content.
  final EdgeInsetsGeometry contentPadding;

  const TextFieldTheme({
    this.shadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.2),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.borderRadius = const Radius.circular(3.0),
    this.color = const Color.fromARGB(255, 41, 45, 53),
    this.borderColor = const Color.fromRGBO(255, 255, 255, 0.05),
    this.borderWidth = 1.0,
    this.textStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.suffixStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.cursorColor = const Color.fromRGBO(4, 180, 255, 1.0),
    this.selectionColor = const Color.fromRGBO(4, 180, 255, 0.67),
    this.contentPadding = const EdgeInsets.all(8.0),
  });

  @override
  List<Object?> get props => [
        shadow,
        borderRadius,
        color,
        borderColor,
        borderWidth,
        textStyle,
        suffixStyle,
        cursorColor,
        selectionColor,
        contentPadding,
      ];

  static TextFieldTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return TextFieldTheme(
      shadow: _getShadowFromDesignLanguage(parameters.designLanguage),
      color: _getColor(parameters),
      borderColor:
          _getDefaultForegroundColorFromBrightness(parameters.brightness)
              .withOpacity(0.05),
      textStyle: _getDefaultTextStyle(parameters),
      suffixStyle: _getDefaultTextStyle(parameters),
      cursorColor: _getCursorColor(parameters),
      selectionColor: _getCursorColor(parameters).withOpacity(0.67),
      contentPadding: _getContentPaddingFromLayout(parameters.layout),
    );
  }

  static List<BoxShadow> _getShadowFromDesignLanguage(
      DesignLanguage designLanguage) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return const [
          BoxShadow(
            blurRadius: 2.0,
            color: Color.fromRGBO(0, 0, 0, 0.2),
            offset: Offset(0.0, 1.0),
          ),
        ];
      case DesignLanguage.flat:
        return const [];
    }
  }

  static Color _getColor(ThemeGeneratorParameters parameters) {
    if (parameters.brightness == Brightness.dark) {
      return parameters.filteredBackgroundColor.lighter(10);
    }

    return parameters.filteredBackgroundColor.lighter(8);
  }

  static Color _getDefaultForegroundColorFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static TextStyle _getDefaultTextStyle(ThemeGeneratorParameters parameters) {
    return TextStyle(
      color: _getDefaultForegroundColorFromBrightness(parameters.brightness),
      fontSize: 13.0,
    );
  }

  static Color _getCursorColor(ThemeGeneratorParameters parameters) {
    final baseColor = parameters.primaryColor;
    if (parameters.brightness == Brightness.dark) {
      return baseColor.lighter(10);
    } else {
      return baseColor.darker(10);
    }
  }

  static EdgeInsets _getContentPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(4.0);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(8.0);
    }
  }
}

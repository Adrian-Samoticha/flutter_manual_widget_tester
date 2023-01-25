import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

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

  static ManualWidgetTesterTextFieldTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterTextFieldTheme(
      textFieldShadow: _getShadowFromDesignLanguage(parameters.designLanguage),
      textFieldColor: _getColor(parameters),
      textFieldBorderColor:
          _getDefaultForegroundColorFromBrightness(parameters.brightness)
              .withOpacity(0.05),
      textFieldTextStyle: _getDefaultTextStyle(parameters),
      textFieldSuffixStyle: _getDefaultTextStyle(parameters),
      textFieldCursorColor: _getCursorColor(parameters),
      textFieldSelectionColor: _getCursorColor(parameters).withOpacity(0.67),
      textFieldContentPadding: _getContentPaddingFromLayout(parameters.layout),
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

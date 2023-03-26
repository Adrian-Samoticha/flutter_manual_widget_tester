import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

class RadioButtonTheme extends Equatable {
  const RadioButtonTheme({
    this.selectedRadioButton = const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(64, 64, 64, 1.0),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(150, 150, 150, 1.0),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            blurRadius: 2.0,
            offset: Offset(0.5, 1.0),
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: FractionallySizedBox(
        widthFactor: 0.67,
        heightFactor: 0.67,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(24, 125, 192, 1.0)),
              BoxShadow(
                color: Color.fromRGBO(32, 175, 255, 1.0),
                spreadRadius: -2.0,
                blurRadius: 2.5,
                offset: Offset(-1.0, -1.0),
              ),
            ],
          ),
          child: FractionallySizedBox(
            widthFactor: 0.24,
            heightFactor: 0.24,
            alignment: Alignment(-0.35, -0.35),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.3),
                    Color.fromRGBO(255, 255, 255, 0.25),
                    Color.fromRGBO(255, 255, 255, 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    this.unselectedRadioButton = const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(52, 52, 52, 1.0),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(82, 82, 82, 1.0),
          ),
        ),
      ),
    ),
    this.spaceBetweenRadioButtonAndLabel = 12.0,
    this.selectedRadioButtonLabelStyle = const TextStyle(
      color: Colors.white,
    ),
    this.unselectedRadioButtonLabelStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
  });

  /// The widget to use as the selected radio button.
  final Widget selectedRadioButton;

  /// The widget to use as the unselected radio button.
  final Widget unselectedRadioButton;

  /// The space between a radio button and its label.
  final double spaceBetweenRadioButtonAndLabel;

  /// The text style of a selected radio buttons label.
  final TextStyle selectedRadioButtonLabelStyle;

  /// The text style of an unselected radio buttons label.
  final TextStyle unselectedRadioButtonLabelStyle;

  @override
  List<Object?> get props => [
        selectedRadioButton,
        unselectedRadioButton,
        spaceBetweenRadioButtonAndLabel,
        selectedRadioButtonLabelStyle,
        unselectedRadioButtonLabelStyle,
      ];

  static RadioButtonTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return RadioButtonTheme(
      selectedRadioButton: _getSelectedRadioButton(parameters),
      unselectedRadioButton: _getUnselectedRadioButton(parameters),
      spaceBetweenRadioButtonAndLabel:
          _getSpaceBetweenRadioButtonAndLabel(parameters),
      selectedRadioButtonLabelStyle:
          _getSelectedRadioButtonLabelStyle(parameters),
      unselectedRadioButtonLabelStyle:
          _getUnselectedRadioButtonLabelStyle(parameters),
    );
  }

  static Widget _getSelectedRadioButton(ThemeGeneratorParameters parameters) {
    final designLanguage = parameters.designLanguage;
    final brightness = parameters.brightness;
    final primaryColor = parameters.primaryColor;
    final filteredBackgroundColor = parameters.filteredBackgroundColor;

    if (designLanguage == DesignLanguage.flat) {
      return DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(64, 64, 64, 1.0),
          border: Border.fromBorderSide(
            BorderSide(
              color: Color.fromRGBO(150, 150, 150, 1.0),
            ),
          ),
        ),
        child: FractionallySizedBox(
          widthFactor: 0.67,
          heightFactor: 0.67,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
          ),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromRGBO(64, 64, 64, 1.0),
        border: const Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(150, 150, 150, 1.0),
          ),
        ),
        boxShadow: brightness == Brightness.light
            ? [
                BoxShadow(
                  color: filteredBackgroundColor.darker(50).withOpacity(0.75),
                  blurRadius: 1.0,
                  offset: const Offset(0.0, 1.0),
                  spreadRadius: 0.0,
                ),
              ]
            : const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  blurRadius: 2.0,
                  offset: Offset(0.5, 1.0),
                  spreadRadius: 1.0,
                ),
              ],
      ),
      child: FractionallySizedBox(
        widthFactor: 0.67,
        heightFactor: 0.67,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: primaryColor.darker(15)),
              BoxShadow(
                color: primaryColor.lighter(15),
                spreadRadius: -2.0,
                blurRadius: 2.5,
                offset: const Offset(-1.0, -1.0),
              ),
            ],
          ),
          child: const FractionallySizedBox(
            widthFactor: 0.24,
            heightFactor: 0.24,
            alignment: Alignment(-0.35, -0.35),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.3),
                    Color.fromRGBO(255, 255, 255, 0.25),
                    Color.fromRGBO(255, 255, 255, 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _getUnselectedRadioButton(
    ThemeGeneratorParameters parameters,
  ) {
    final brightness = parameters.brightness;
    final filteredBackgroundColor = parameters.filteredBackgroundColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: brightness == Brightness.light
            ? filteredBackgroundColor.darker(10)
            : filteredBackgroundColor.lighter(10),
        border: Border.fromBorderSide(
          BorderSide(
            color: brightness == Brightness.light
                ? filteredBackgroundColor.darker(30)
                : filteredBackgroundColor.lighter(30),
          ),
        ),
      ),
    );
  }

  static double _getSpaceBetweenRadioButtonAndLabel(
    ThemeGeneratorParameters parameters,
  ) {
    final layout = parameters.layout;

    switch (layout) {
      case Layout.compact:
        return 8.0;
      case Layout.normal:
        return 12.0;
      case Layout.cozy:
        return 16.0;
    }
  }

  static TextStyle _getSelectedRadioButtonLabelStyle(
    ThemeGeneratorParameters parameters,
  ) {
    final brightness = parameters.brightness;
    final layout = parameters.layout;

    return TextStyle(
      color: brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: layout == Layout.compact ? 10.0 : null,
    );
  }

  static TextStyle _getUnselectedRadioButtonLabelStyle(
    ThemeGeneratorParameters parameters,
  ) {
    final brightness = parameters.brightness;
    final layout = parameters.layout;

    return TextStyle(
      color: brightness == Brightness.light
          ? const Color.fromRGBO(0, 0, 0, 0.5)
          : const Color.fromRGBO(255, 255, 255, 0.5),
      fontSize: layout == Layout.compact ? 10.0 : null,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterButtonTheme extends Equatable {
  /// The buttons' color.
  final Color buttonColor;

  /// The buttons' border radius.
  final Radius buttonBorderRadius;

  /// The buttons' shadow(s).
  final List<BoxShadow> buttonShadow;

  /// The color to tint the button with when it is pressed.
  final Color buttonPressedTint;

  /// The color to tint the button with when it is hovered over.
  final Color buttonHoveredTint;

  /// The offset of the button when it is pressed.
  final Offset buttonPressedOffset;

  /// The color of the line that separates two buttons within a button row.
  final Color buttonSeparatorColor;

  /// The width of the line that separates two buttons within a button row.
  final double buttonSeparatorWidth;

  /// The icon theme of a disabled button.
  final IconThemeData disabledButtonIconTheme;

  /// The icon theme of a pressed button.
  final IconThemeData pressedButtonIconTheme;

  /// The icon theme of an enabled, unpressed button.
  final IconThemeData buttonIconTheme;

  /// The text style of a disabled button.
  final TextStyle disabledButtonTextStyle;

  /// The text style of a pressed button.
  final TextStyle pressedButtonTextStyle;

  /// The text style of an enabled, unpressed button.
  final TextStyle buttonTextStyle;

  /// The border of the individual button inside a button row.
  final BoxBorder buttonBoxBorder;

  const ManualWidgetTesterButtonTheme({
    this.buttonColor = const Color.fromRGBO(45, 50, 59, 1.0),
    this.buttonBorderRadius = const Radius.circular(3.0),
    this.buttonShadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.2),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.buttonPressedTint = const Color.fromRGBO(0, 0, 0, 0.1),
    this.buttonHoveredTint = const Color.fromRGBO(255, 255, 255, 0.05),
    this.buttonPressedOffset = const Offset(0.0, 0.5),
    this.buttonSeparatorColor = const Color.fromRGBO(0, 0, 0, 0.2),
    this.buttonSeparatorWidth = 1.2,
    this.disabledButtonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.25),
      size: 18.5,
    ),
    this.pressedButtonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      size: 18.5,
    ),
    this.buttonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      size: 18.5,
    ),
    this.disabledButtonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.25),
    ),
    this.pressedButtonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
    this.buttonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.buttonBoxBorder = const GradientBoxBorder(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(255, 255, 255, 0.1),
          Colors.transparent,
          Colors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      width: 1.0,
    ),
  });

  @override
  List<Object?> get props => [
        buttonColor,
        buttonBorderRadius,
        buttonShadow,
        buttonPressedTint,
        buttonHoveredTint,
        buttonPressedOffset,
        buttonSeparatorColor,
        buttonSeparatorWidth,
        disabledButtonIconTheme,
        pressedButtonIconTheme,
        buttonIconTheme,
        disabledButtonTextStyle,
        pressedButtonTextStyle,
        buttonTextStyle,
        buttonBoxBorder,
      ];

  static ManualWidgetTesterButtonTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterButtonTheme(
      buttonColor: parameters.backgroundColor.lighter(32),
      buttonShadow:
          _getButtonShadowFromDesignLanguage(parameters.designLanguage),
      disabledButtonIconTheme: IconThemeData(
        color: _getColorFromBrightness(parameters.brightness).withOpacity(0.25),
        size: _getIconSizeFromLayout(parameters.layout),
      ),
      pressedButtonIconTheme: IconThemeData(
        color: _getColorFromBrightness(parameters.brightness).withOpacity(0.5),
        size: _getIconSizeFromLayout(parameters.layout),
      ),
      buttonIconTheme: IconThemeData(
        color: _getColorFromBrightness(parameters.brightness).withOpacity(0.9),
        size: _getIconSizeFromLayout(parameters.layout),
      ),
      disabledButtonTextStyle: TextStyle(
        color: _getColorFromBrightness(parameters.brightness).withOpacity(0.25),
      ),
      pressedButtonTextStyle: TextStyle(
        color: _getColorFromBrightness(parameters.brightness).withOpacity(0.5),
      ),
      buttonTextStyle: TextStyle(
        color: _getColorFromBrightness(parameters.brightness).withOpacity(0.9),
      ),
      buttonBoxBorder:
          _getButtonBoxBorderFromDesignLanguage(parameters.designLanguage),
    );
  }

  static List<BoxShadow> _getButtonShadowFromDesignLanguage(
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

  static Color _getColorFromBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const Color.fromRGBO(255, 255, 255, 1.0);
      case Brightness.light:
        return const Color.fromRGBO(0, 0, 0, 1.0);
    }
  }

  static double _getIconSizeFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 16.0;
      case Layout.normal:
        return 18.5;
      case Layout.cozy:
        return 20.0;
    }
  }

  static BoxBorder _getButtonBoxBorderFromDesignLanguage(
      DesignLanguage designLanguage) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return const GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 0.1),
              Colors.transparent,
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          width: 1.0,
        );
      case DesignLanguage.flat:
        return const Border();
    }
  }
}

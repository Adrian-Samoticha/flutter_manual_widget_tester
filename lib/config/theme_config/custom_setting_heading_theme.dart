import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterCustomSettingHeadingTheme extends Equatable {
  /// The text style of a custom setting's heading.
  final TextStyle customSettingHeadingTextStyle;

  /// The text overflow behavior of a custom setting's heading.
  final TextOverflow customSettingHeadingOverflow;

  /// The padding of a custom setting's heading.
  final EdgeInsets customSettingHeadingPadding;

  const ManualWidgetTesterCustomSettingHeadingTheme({
    this.customSettingHeadingTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.customSettingHeadingOverflow = TextOverflow.ellipsis,
    this.customSettingHeadingPadding = const EdgeInsets.only(bottom: 5.0),
  });

  @override
  List<Object?> get props => [
        customSettingHeadingTextStyle,
        customSettingHeadingOverflow,
        customSettingHeadingPadding,
      ];

  static ManualWidgetTesterCustomSettingHeadingTheme
      fromThemeGeneratorParameters(ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterCustomSettingHeadingTheme(
      customSettingHeadingTextStyle:
          _getCustomSettingHeadingTextStyleFromBrightness(
              parameters.brightness),
      customSettingHeadingPadding:
          _getCustomSettingHeadingPaddingFromLayout(parameters.layout),
    );
  }

  static TextStyle _getCustomSettingHeadingTextStyleFromBrightness(
      Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.9),
        );
      case Brightness.light:
        return const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.9),
        );
    }
  }

  static EdgeInsets _getCustomSettingHeadingPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.only(bottom: 4.0);
      case Layout.normal:
        return const EdgeInsets.only(bottom: 5.0);
      case Layout.cozy:
        return const EdgeInsets.only(bottom: 6.0);
    }
  }
}

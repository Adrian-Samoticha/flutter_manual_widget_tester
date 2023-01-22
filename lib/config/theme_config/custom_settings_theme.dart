import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterCustomSettingsTheme extends Equatable {
  /// The padding of a custom settings widget.
  final EdgeInsets customSettingsPadding;

  const ManualWidgetTesterCustomSettingsTheme({
    this.customSettingsPadding = const EdgeInsets.all(8.0),
  });

  @override
  List<Object?> get props => [
        customSettingsPadding,
      ];

  static ManualWidgetTesterCustomSettingsTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterCustomSettingsTheme(
      customSettingsPadding:
          _getCustomSettingsPaddingFromLayout(parameters.layout),
    );
  }

  static EdgeInsets _getCustomSettingsPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(6.0);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(12.0);
    }
  }
}

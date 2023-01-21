import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterBoolEditorTheme extends Equatable {
  /// The maximal width of a boolean editor.
  final double boolEditorMaxWidth;

  /// The space between the radio buttons in the boolean editor.
  final double boolEditorSpaceBetweenRadioButtons;

  /// The boolean editor's padding.
  final EdgeInsets boolEditorRadioButtonPadding;

  /// The height of the boolean editor.
  final double boolEditorHeight;

  const ManualWidgetTesterBoolEditorTheme({
    this.boolEditorMaxWidth = 192.0,
    this.boolEditorSpaceBetweenRadioButtons = 12.0,
    this.boolEditorRadioButtonPadding =
        const EdgeInsets.symmetric(vertical: 8.0),
    this.boolEditorHeight = 16.0,
  });

  @override
  List<Object?> get props => [
        boolEditorMaxWidth,
        boolEditorSpaceBetweenRadioButtons,
        boolEditorRadioButtonPadding,
        boolEditorHeight,
      ];

  static ManualWidgetTesterBoolEditorTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterBoolEditorTheme(
      boolEditorMaxWidth: _getBoolEditorMaxWidthFromLayout(parameters.layout),
      boolEditorSpaceBetweenRadioButtons:
          _getBoolEditorSpaceBetweenRadioButtons(parameters.layout),
      boolEditorRadioButtonPadding:
          _getBoolEditorRadioButtonPadding(parameters.layout),
      boolEditorHeight: _getBoolEditorHeightFromLayout(parameters.layout),
    );
  }

  static double _getBoolEditorMaxWidthFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 160.0;
      case Layout.normal:
        return 192.0;
      case Layout.cozy:
        return 200.0;
    }
  }

  static double _getBoolEditorSpaceBetweenRadioButtons(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 8.0;
      case Layout.normal:
        return 12.0;
      case Layout.cozy:
        return 16.0;
    }
  }

  static EdgeInsets _getBoolEditorRadioButtonPadding(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.symmetric(vertical: 6.0);
      case Layout.normal:
        return const EdgeInsets.symmetric(vertical: 8.0);
      case Layout.cozy:
        return const EdgeInsets.symmetric(vertical: 10.0);
    }
  }

  static double _getBoolEditorHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 12.0;
      case Layout.normal:
        return 16.0;
      case Layout.cozy:
        return 20.0;
    }
  }
}

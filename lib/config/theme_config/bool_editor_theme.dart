import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class BoolEditorTheme extends Equatable {
  /// The maximal width of a boolean editor.
  final double maxWidth;

  /// The space between the radio buttons in the boolean editor.
  final double spaceBetweenRadioButtons;

  /// The boolean editor's padding.
  final EdgeInsets radioButtonPadding;

  /// The height of the boolean editor.
  final double editorHeight;

  const BoolEditorTheme({
    this.maxWidth = 192.0,
    this.spaceBetweenRadioButtons = 12.0,
    this.radioButtonPadding = const EdgeInsets.symmetric(vertical: 8.0),
    this.editorHeight = 16.0,
  });

  @override
  List<Object?> get props => [
        maxWidth,
        spaceBetweenRadioButtons,
        radioButtonPadding,
        editorHeight,
      ];

  static BoolEditorTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return BoolEditorTheme(
      maxWidth: _getMaxWidthFromLayout(parameters.layout),
      spaceBetweenRadioButtons: _getSpaceBetweenRadioButtons(parameters.layout),
      radioButtonPadding: _getRadioButtonPadding(parameters.layout),
      editorHeight: _getHeightFromLayout(parameters.layout),
    );
  }

  static double _getMaxWidthFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 160.0;
      case Layout.normal:
        return 192.0;
      case Layout.cozy:
        return 200.0;
    }
  }

  static double _getSpaceBetweenRadioButtons(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 8.0;
      case Layout.normal:
        return 12.0;
      case Layout.cozy:
        return 16.0;
    }
  }

  static EdgeInsets _getRadioButtonPadding(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.symmetric(vertical: 6.0);
      case Layout.normal:
        return const EdgeInsets.symmetric(vertical: 8.0);
      case Layout.cozy:
        return const EdgeInsets.symmetric(vertical: 10.0);
    }
  }

  static double _getHeightFromLayout(Layout layout) {
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

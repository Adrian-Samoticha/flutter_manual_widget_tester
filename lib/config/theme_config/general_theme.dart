import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

class GeneralTheme extends Equatable {
  /// Whether this is a dark theme.
  final bool isDark;

  /// The color of the manual widget tester's background.
  final Color backgroundColor;

  /// The color of the manual widget tester's sidebar.
  final Color sidebarColor;

  /// The accent color, currently used only for the decoration of the focused
  /// tab.
  final Color accentColor;

  /// The space between text boxes and connected button rows.
  final double spaceBetweenTextBoxesAndButtonRows;

  /// The default width of the number editor button row.
  ///
  /// The width gets reduced if the sidebar is too narrow.
  final double defaultNumberEditorButtonRowWidth;

  /// The duration of the scroll animation that plays when a widget is moved
  /// into view.
  final Duration scrollIntoViewDuration;

  /// Creates a “general” theme object.
  ///
  /// This theme contains miscellaneous properties that do not fit into the
  /// other themes.
  const GeneralTheme({
    this.isDark = true,
    this.backgroundColor = const Color.fromRGBO(41, 43, 53, 1.0),
    this.sidebarColor = const Color.fromRGBO(33, 37, 43, 1.0),
    this.accentColor = const Color.fromARGB(255, 40, 138, 251),
    this.spaceBetweenTextBoxesAndButtonRows = 0.5,
    this.defaultNumberEditorButtonRowWidth = 64.0,
    this.scrollIntoViewDuration = const Duration(milliseconds: 250),
  });

  @override
  List<Object?> get props => [
        isDark,
        backgroundColor,
        sidebarColor,
        accentColor,
        spaceBetweenTextBoxesAndButtonRows,
        defaultNumberEditorButtonRowWidth,
        scrollIntoViewDuration,
      ];

  static GeneralTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return GeneralTheme(
      isDark: parameters.brightness == Brightness.dark,
      backgroundColor: parameters.filteredBackgroundColor,
      sidebarColor: parameters.filteredBackgroundColor.darker(6),
      accentColor: parameters.primaryColor,
      scrollIntoViewDuration: _getScrollIntoViewDurationFromAnimationSpeed(
          parameters.animationSpeed),
    );
  }

  static Duration _getScrollIntoViewDurationFromAnimationSpeed(
      AnimationSpeed animationSpeed) {
    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 125);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 250);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 500);
    }
  }
}

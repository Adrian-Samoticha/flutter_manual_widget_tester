import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class TestSessionMenuItemTheme extends Equatable {
  /// The height of a menu item in the “RUNNING TEST SESSIONS” area.
  final double height;

  /// The opacity of an unfocused menu item in the “RUNNING TEST SESSIONS” area.
  final double unfocusedTabOpacity;

  /// The padding of a menu item in the “RUNNING TEST SESSIONS” area.
  final EdgeInsets padding;

  /// The padding of a menu item's close button in the “RUNNING TEST SESSIONS”
  /// area.
  final EdgeInsets closeButtonPadding;

  /// The size of a menu item's close button in the “RUNNING TEST SESSIONS”
  /// area.
  final double closeButtonSize;

  /// The text overflow behavior of a menu item in the “RUNNING TEST SESSIONS”
  /// area.
  final TextOverflow textOverflow;

  /// The text style of a menu item in the “RUNNING TEST SESSIONS” area.
  final TextStyle textStyle;

  /// The icon size of a menu item in the “RUNNING TEST SESSIONS” area.
  final double iconSize;

  /// The hover tint decoration of a menu item in the “RUNNING TEST SESSIONS”
  /// area.
  final BoxDecoration hoverTintDecoration;

  /// The icon padding of a menu item in the “RUNNING TEST SESSIONS” area.
  final EdgeInsets tabIconPadding;

  /// The tint decoration of a focused menu item in the “RUNNING TEST SESSIONS”
  /// area.
  final BoxDecoration focusedTabTintDecoration;

  const TestSessionMenuItemTheme({
    this.height = 24.0,
    this.unfocusedTabOpacity = 0.5,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.closeButtonPadding = const EdgeInsets.only(left: 8.0),
    this.closeButtonSize = 12.0,
    this.textOverflow = TextOverflow.ellipsis,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    ),
    this.iconSize = 18.0,
    this.hoverTintDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.1),
    ),
    this.tabIconPadding = const EdgeInsets.only(right: 8.0),
    this.focusedTabTintDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.15),
    ),
  });

  @override
  List<Object?> get props => [
        height,
        unfocusedTabOpacity,
        padding,
        closeButtonPadding,
        closeButtonSize,
        textOverflow,
        textStyle,
        iconSize,
        hoverTintDecoration,
        tabIconPadding,
        focusedTabTintDecoration,
      ];

  static TestSessionMenuItemTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const TestSessionMenuItemTheme();
  }
}

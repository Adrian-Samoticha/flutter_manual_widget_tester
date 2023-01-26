import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class DragHandleTheme extends Equatable {
  /// The color of the drag handle that appears when the sidebar is being
  /// resized.
  final Color color;

  /// The size of the drag handle that appears when the sidebar is being
  /// resized.
  final double size;

  /// The duration of the drag handle's fade animation.
  ///
  /// The “drag handle” refers to the line that appears when the sidebar is
  /// being resized.
  final Duration opacityChangeDuration;

  /// The amount of time until the drag handle appears when sidebar's edge is
  /// being hovered over.
  final Duration timeUntilDragHandleAppears;

  const DragHandleTheme({
    this.color = Colors.blue,
    this.size = 6.0,
    this.opacityChangeDuration = const Duration(milliseconds: 150),
    this.timeUntilDragHandleAppears = const Duration(milliseconds: 250),
  });

  @override
  List<Object?> get props => [
        color,
        size,
        opacityChangeDuration,
        timeUntilDragHandleAppears,
      ];

  static DragHandleTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const DragHandleTheme();
  }
}

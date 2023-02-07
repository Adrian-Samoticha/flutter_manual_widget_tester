import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

class DragHandleTheme extends Equatable {
  const DragHandleTheme({
    this.color = Colors.blue,
    this.size = 6.0,
    this.opacityChangeDuration = const Duration(milliseconds: 150),
    this.timeUntilDragHandleAppears = const Duration(milliseconds: 250),
  });

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

  @override
  List<Object?> get props => [
        color,
        size,
        opacityChangeDuration,
        timeUntilDragHandleAppears,
      ];

  static DragHandleTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return DragHandleTheme(
      color: _getColor(parameters),
      opacityChangeDuration: _getOpacityChangeDurationFromAnimationSpeed(
        parameters.animationSpeed,
      ),
    );
  }

  static Color _getColor(ThemeGeneratorParameters parameters) {
    if (parameters.brightness == Brightness.dark) {
      return parameters.primaryColor.lighter(4);
    }

    return parameters.primaryColor.darker(2);
  }

  static Duration _getOpacityChangeDurationFromAnimationSpeed(
    AnimationSpeed animationSpeed,
  ) {
    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 80);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 150);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 300);
    }
  }
}

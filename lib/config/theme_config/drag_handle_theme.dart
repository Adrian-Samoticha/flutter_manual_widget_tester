import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterDragHandleTheme extends Equatable {
  /// The color of the drag handle that appears when the sidebar is being
  /// resized.
  final Color dragHandleColor;

  /// The size of the drag handle that appears when the sidebar is being
  /// resized.
  final double dragHandleSize;

  /// The duration of the drag handle's fade animation.
  ///
  /// The “drag handle” refers to the line that appears when the sidebar is
  /// being resized.
  final Duration dragHandleChangeOpacityDuration;

  /// The amount of time until the drag handle appears when sidebar's edge is
  /// being hovered over.
  final Duration timeUntilDragHandleAppears;

  const ManualWidgetTesterDragHandleTheme({
    this.dragHandleColor = Colors.blue,
    this.dragHandleSize = 6.0,
    this.dragHandleChangeOpacityDuration = const Duration(milliseconds: 150),
    this.timeUntilDragHandleAppears = const Duration(milliseconds: 250),
  });

  @override
  List<Object?> get props => [
        dragHandleColor,
        dragHandleSize,
        dragHandleChangeOpacityDuration,
        timeUntilDragHandleAppears,
      ];
}

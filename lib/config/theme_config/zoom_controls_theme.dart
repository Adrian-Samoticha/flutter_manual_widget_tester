import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ZoomControlsTheme extends Equatable {
  /// The width of the zoom controls.
  final double width;

  /// The height of the zoom controls.
  final double height;

  /// The border radius of the zoom controls.
  final BorderRadius borderRadius;

  /// The shadow(s) of the zoom controls.
  final List<BoxShadow> shadow;

  /// The padding of the zoom controls.
  final EdgeInsets padding;

  /// The width of the zoom controls' button row.
  final double buttonRowWidth;

  /// The icon on the zoom controls' zoom out button.
  final Icon zoomOutIcon;

  /// The icon on the zoom controls' zoom in button.
  final Icon zoomInIcon;

  /// The zoom controls' distance to the manual widget tester's border.
  final double distanceToBorder;

  /// The zoom controls' alignment.
  final Alignment alignment;

  const ZoomControlsTheme({
    this.width = 128.0,
    this.height = 32.0,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(3.0),
    ),
    this.shadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.padding = const EdgeInsets.all(3.5),
    this.buttonRowWidth = 64.0,
    this.zoomOutIcon = const Icon(Icons.zoom_out),
    this.zoomInIcon = const Icon(Icons.zoom_in),
    this.distanceToBorder = 8.0,
    this.alignment = Alignment.bottomCenter,
  });

  @override
  List<Object?> get props => [
        width,
        height,
        borderRadius,
        shadow,
        padding,
        buttonRowWidth,
        zoomOutIcon,
        zoomInIcon,
        distanceToBorder,
        alignment,
      ];

  static ZoomControlsTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const ZoomControlsTheme();
  }
}

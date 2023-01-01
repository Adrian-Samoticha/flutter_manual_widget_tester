import 'package:flutter/material.dart';

class ManualWidgetTesterZoomControlsTheme {
  /// The width of the zoom controls.
  final double zoomControlsWidth;

  /// The height of the zoom controls.
  final double zoomControlsHeight;

  /// The border radius of the zoom controls.
  final BorderRadius zoomControlsBorderRadius;

  /// The shadow(s) of the zoom controls.
  final List<BoxShadow> zoomControlsShadow;

  /// The padding of the zoom controls.
  final EdgeInsets zoomControlsPadding;

  /// The width of the zoom controls' button row.
  final double zoomControlsButtonRowWidth;

  /// The icon on the zoom controls' zoom out button.
  final Icon zoomControlsZoomOutIcon;

  /// The icon on the zoom controls' zoom in button.
  final Icon zoomControlsZoomInIcon;

  /// The zoom controls' distance to the manual widget tester's border.
  final double zoomControlsDistanceToBorder;

  /// The zoom controls' alignment.
  final Alignment zoomControlsAlignment;

  const ManualWidgetTesterZoomControlsTheme({
    this.zoomControlsWidth = 128.0,
    this.zoomControlsHeight = 32.0,
    this.zoomControlsBorderRadius = const BorderRadius.all(
      Radius.circular(3.0),
    ),
    this.zoomControlsShadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.zoomControlsPadding = const EdgeInsets.all(3.5),
    this.zoomControlsButtonRowWidth = 64.0,
    this.zoomControlsZoomOutIcon = const Icon(Icons.zoom_out),
    this.zoomControlsZoomInIcon = const Icon(Icons.zoom_in),
    this.zoomControlsDistanceToBorder = 8.0,
    this.zoomControlsAlignment = Alignment.bottomCenter,
  });
}

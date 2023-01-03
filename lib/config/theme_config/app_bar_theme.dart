import 'package:flutter/material.dart';

class ManualWidgetTesterAppBarTheme {
  /// The height of the app bar on the top of the widget.
  ///
  /// The app bar is the bar that houses the tab bar and the “create new test
  /// session” button.
  final double appBarHeight;

  /// The height of the container that simulates the shadow at the bottom of
  /// the app bar.
  final double appBarShadowHeight;

  /// The box decoration of the container that simulates the shadow at the
  /// bottom of the app bar.
  final BoxDecoration appBarShadowBoxDecoration;

  const ManualWidgetTesterAppBarTheme({
    this.appBarHeight = 40.0,
    this.appBarShadowHeight = 16.0,
    this.appBarShadowBoxDecoration = const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(0, 0, 0, 0.15),
          Colors.transparent,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
  });
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class AppBarTheme extends Equatable {
  const AppBarTheme({
    this.height = 40.0,
    this.shadowHeight = 16.0,
    this.shadowBoxDecoration = const BoxDecoration(
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

  /// The height of the app bar on the top of the widget.
  ///
  /// The app bar is the bar that houses the tab bar and the “create new test
  /// session” button.
  final double height;

  /// The height of the container that simulates the shadow at the bottom of
  /// the app bar.
  final double shadowHeight;

  /// The box decoration of the container that simulates the shadow at the
  /// bottom of the app bar.
  final BoxDecoration shadowBoxDecoration;

  @override
  List<Object?> get props => [
        height,
        shadowHeight,
        shadowBoxDecoration,
      ];

  static AppBarTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return AppBarTheme(
      height: _getHeightFromLayout(parameters.layout),
      shadowHeight: _getShadowHeight(parameters),
      shadowBoxDecoration: _getShadowBoxDecoration(parameters),
    );
  }

  static double _getHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 32.0;
      case Layout.normal:
        return 40.0;
      case Layout.cozy:
        return 48.0;
    }
  }

  static double _getShadowHeight(ThemeGeneratorParameters parameters) {
    switch (parameters.designLanguage) {
      case DesignLanguage.skeuomorphic:
        return parameters.brightness == Brightness.dark ? 16.0 : 12.0;
      case DesignLanguage.flat:
        return 0.0;
    }
  }

  static BoxDecoration _getShadowBoxDecoration(
    ThemeGeneratorParameters parameters,
  ) {
    switch (parameters.designLanguage) {
      case DesignLanguage.skeuomorphic:
        return BoxDecoration(
          gradient: LinearGradient(
            colors: [
              parameters.brightness == Brightness.dark
                  ? const Color.fromRGBO(0, 0, 0, 0.15)
                  : const Color.fromRGBO(0, 0, 0, 0.08),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        );
      case DesignLanguage.flat:
        return const BoxDecoration();
    }
  }
}

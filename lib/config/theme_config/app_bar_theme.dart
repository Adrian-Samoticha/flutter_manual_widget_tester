import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class AppBarTheme extends Equatable {
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

  @override
  List<Object?> get props => [
        height,
        shadowHeight,
        shadowBoxDecoration,
      ];

  static AppBarTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return AppBarTheme(
      height: _getHeightFromLayout(parameters.layout),
      shadowHeight:
          _getShadowHeightFromDesignLanguage(parameters.designLanguage),
      shadowBoxDecoration:
          _getShadowBoxDecorationFromDesignLanguage(parameters.designLanguage),
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

  static double _getShadowHeightFromDesignLanguage(
      DesignLanguage designLanguage) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return 16.0;
      case DesignLanguage.flat:
        return 0.0;
    }
  }

  static BoxDecoration _getShadowBoxDecorationFromDesignLanguage(
      DesignLanguage designLanguage) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 0.15),
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

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterAppBarTheme extends Equatable {
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

  @override
  List<Object?> get props => [
        appBarHeight,
        appBarShadowHeight,
        appBarShadowBoxDecoration,
      ];

  static double _getAppBarHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 32.0;
      case Layout.normal:
        return 40.0;
      case Layout.cozy:
        return 64.0;
    }
  }

  static double _getAppBarShadowHeightFromDesignLanguage(
      DesignLanguage designLanguage) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return 16.0;
      case DesignLanguage.flat:
        return 0.0;
    }
  }

  static BoxDecoration _getAppBarShadowBoxDecorationFromDesignLanguage(
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

  static ManualWidgetTesterAppBarTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterAppBarTheme(
      appBarHeight: _getAppBarHeightFromLayout(parameters.layout),
      appBarShadowHeight:
          _getAppBarShadowHeightFromDesignLanguage(parameters.designLanguage),
      appBarShadowBoxDecoration:
          _getAppBarShadowBoxDecorationFromDesignLanguage(
              parameters.designLanguage),
    );
  }
}

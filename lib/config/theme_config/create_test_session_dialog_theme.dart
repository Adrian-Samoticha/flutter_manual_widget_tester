import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterCreateTestSessionDialogTheme extends Equatable {
  /// The width of the “create test session” button.
  final double createTestSessionDialogWidth;

  /// The padding of the “create test session” dialog.
  final EdgeInsets createTestSessionDialogPadding;

  /// The height factor of the “create test session” dialog's search result list
  /// in relation to the window's height.
  ///
  /// A height factor of 0.5 means that the search result list covers 50 % of
  /// the application window.
  final double createTestSessionDialogSearchResultsHeightFactor;

  /// The height of the “create test session” dialog's search bar.
  final double createTestSessionDialogSearchBarHeight;

  /// The padding of the “create test session” dialog's search results.
  final EdgeInsets createTestSessionDialogSearchResultsPadding;

  /// The height of a single item in the “create test session” dialog's search
  /// results.
  final double createTestSessionDialogSearchResultHeight;

  /// The box decoration of the “create test session” dialog's selected search
  /// result.
  final BoxDecoration createTestSessionDialogSelectedSearchResultDecoration;

  /// The box decoration of the “create test session” dialog's unselected search
  /// results.
  final BoxDecoration createTestSessionDialogUnselectedSearchResultDecoration;

  /// The text style of the “create test session” dialog's search results.
  final TextStyle createTestSessionDialogSearchResultTextStyle;

  /// The padding of the “create test session” dialog's search result icons.
  final EdgeInsets createTestSessionDialogSearchResultIconPadding;

  /// The size of the “create test session” dialog's search result icons.
  final double createTestSessionDialogSearchResultIconSize;

  /// The duration of the “create test session” dialog's search result fade
  /// animation.
  final Duration createTestSessionDialogSearchResultFadeDuration;

  /// The opacity of the “create test session” dialog's unselected search
  /// results.
  final double createTestSessionDialogUnselectedSearchResultOpacity;

  /// The text style of the “create test session” dialog's *“No matching
  /// results.”* text.
  final TextStyle createTestSessionDialogNoMatchingResultsTextStyle;

  const ManualWidgetTesterCreateTestSessionDialogTheme({
    this.createTestSessionDialogWidth = 512.0,
    this.createTestSessionDialogPadding = const EdgeInsets.all(8.0),
    this.createTestSessionDialogSearchResultsHeightFactor = 0.5,
    this.createTestSessionDialogSearchBarHeight = 32.0,
    this.createTestSessionDialogSearchResultsPadding =
        const EdgeInsets.only(top: 8.0),
    this.createTestSessionDialogSearchResultHeight = 28.0,
    this.createTestSessionDialogSelectedSearchResultDecoration =
        const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.15),
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.15),
        ),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    this.createTestSessionDialogUnselectedSearchResultDecoration =
        const BoxDecoration(),
    this.createTestSessionDialogSearchResultTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.createTestSessionDialogSearchResultIconPadding =
        const EdgeInsets.only(right: 8.0, left: 2.0),
    this.createTestSessionDialogSearchResultIconSize = 21.0,
    this.createTestSessionDialogSearchResultFadeDuration =
        const Duration(milliseconds: 100),
    this.createTestSessionDialogUnselectedSearchResultOpacity = 0.5,
    this.createTestSessionDialogNoMatchingResultsTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
  });

  @override
  List<Object?> get props => [
        createTestSessionDialogWidth,
        createTestSessionDialogPadding,
        createTestSessionDialogSearchResultsHeightFactor,
        createTestSessionDialogSearchBarHeight,
        createTestSessionDialogSearchResultsPadding,
        createTestSessionDialogSearchResultHeight,
        createTestSessionDialogSelectedSearchResultDecoration,
        createTestSessionDialogUnselectedSearchResultDecoration,
        createTestSessionDialogSearchResultTextStyle,
        createTestSessionDialogSearchResultIconPadding,
        createTestSessionDialogSearchResultIconSize,
        createTestSessionDialogSearchResultFadeDuration,
        createTestSessionDialogUnselectedSearchResultOpacity,
        createTestSessionDialogNoMatchingResultsTextStyle,
      ];

  static ManualWidgetTesterCreateTestSessionDialogTheme
      fromThemeGeneratorParameters(ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterCreateTestSessionDialogTheme(
      createTestSessionDialogPadding:
          _getCreateTestSessionDialogPaddingFromLayout(parameters.layout),
      createTestSessionDialogSearchBarHeight:
          _getCreateTestSessionDialogSearchBarHeightFromLayout(
              parameters.layout),
      createTestSessionDialogSearchResultsPadding:
          _getCreateTestSessionDialogSearchResultsPaddingFromLayout(
              parameters.layout),
      createTestSessionDialogSearchResultHeight:
          _getCreateTestSessionDialogSearchResultHeightFromLayout(
              parameters.layout),
      createTestSessionDialogSelectedSearchResultDecoration:
          _getCreateTestSessionDialogSelectedSearchResultDecorationFromBrightness(
              parameters.brightness),
      createTestSessionDialogSearchResultTextStyle:
          _getCreateTestSessionDialogSearchResultTextStyleFromBrightness(
              parameters.brightness),
      createTestSessionDialogSearchResultIconSize:
          _getCreateTestSessionDialogSearchResultIconSizeFromLayout(
              parameters.layout),
      createTestSessionDialogSearchResultFadeDuration:
          _getCreateTestSessionDialogSearchResultFadeDurationFromAnimationSpeed(
              parameters.animationSpeed),
      createTestSessionDialogNoMatchingResultsTextStyle:
          _getCreateTestSessionDialogNoMatchingResultsTextStyleFromBrightness(
              parameters.brightness),
    );
  }

  static EdgeInsets _getCreateTestSessionDialogPaddingFromLayout(
      Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(5.5);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(11.5);
    }
  }

  static double _getCreateTestSessionDialogSearchBarHeightFromLayout(
      Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 32.0;
      case Layout.cozy:
        return 48.0;
    }
  }

  static EdgeInsets _getCreateTestSessionDialogSearchResultsPaddingFromLayout(
      Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.only(top: 5.5);
      case Layout.normal:
        return const EdgeInsets.only(top: 8.0);
      case Layout.cozy:
        return const EdgeInsets.only(top: 11.5);
    }
  }

  static double _getCreateTestSessionDialogSearchResultHeightFromLayout(
      Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 28.0;
      case Layout.cozy:
        return 32.0;
    }
  }

  static BoxDecoration
      _getCreateTestSessionDialogSelectedSearchResultDecorationFromBrightness(
          Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.15),
          border: Border.fromBorderSide(
            BorderSide(
              color: Color.fromRGBO(255, 255, 255, 0.15),
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        );
      case Brightness.light:
        return const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.15),
          border: Border.fromBorderSide(
            BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.15),
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        );
    }
  }

  static TextStyle
      _getCreateTestSessionDialogSearchResultTextStyleFromBrightness(
          Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const TextStyle(
          color: Colors.white,
        );
      case Brightness.light:
        return const TextStyle(
          color: Colors.black,
        );
    }
  }

  static double _getCreateTestSessionDialogSearchResultIconSizeFromLayout(
      Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 18.0;
      case Layout.normal:
        return 21.0;
      case Layout.cozy:
        return 24.0;
    }
  }

  static Duration
      _getCreateTestSessionDialogSearchResultFadeDurationFromAnimationSpeed(
          AnimationSpeed animationSpeed) {
    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 50);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 100);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 200);
    }
  }

  static TextStyle
      _getCreateTestSessionDialogNoMatchingResultsTextStyleFromBrightness(
          Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.9),
        );
      case Brightness.light:
        return const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.9),
        );
    }
  }
}

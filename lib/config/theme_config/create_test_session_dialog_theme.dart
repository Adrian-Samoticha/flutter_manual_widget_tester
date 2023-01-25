import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class CreateTestSessionDialogTheme extends Equatable {
  /// The width of the “create test session” button.
  final double width;

  /// The padding of the “create test session” dialog.
  final EdgeInsets padding;

  /// The height factor of the “create test session” dialog's search result list
  /// in relation to the window's height.
  ///
  /// A height factor of 0.5 means that the search result list covers 50 % of
  /// the application window.
  final double searchResultsHeightFactor;

  /// The height of the “create test session” dialog's search bar.
  final double searchBarHeight;

  /// The padding of the “create test session” dialog's search results.
  final EdgeInsets searchResultsPadding;

  /// The height of a single item in the “create test session” dialog's search
  /// results.
  final double searchResultHeight;

  /// The box decoration of the “create test session” dialog's selected search
  /// result.
  final BoxDecoration selectedSearchResultDecoration;

  /// The box decoration of the “create test session” dialog's unselected search
  /// results.
  final BoxDecoration unselectedSearchResultDecoration;

  /// The text style of the “create test session” dialog's search results.
  final TextStyle searchResultTextStyle;

  /// The padding of the “create test session” dialog's search result icons.
  final EdgeInsets searchResultIconPadding;

  /// The size of the “create test session” dialog's search result icons.
  final double searchResultIconSize;

  /// The duration of the “create test session” dialog's search result fade
  /// animation.
  final Duration searchResultFadeDuration;

  /// The opacity of the “create test session” dialog's unselected search
  /// results.
  final double unselectedSearchResultOpacity;

  /// The text style of the “create test session” dialog's *“No matching
  /// results.”* text.
  final TextStyle noMatchingResultsTextStyle;

  const CreateTestSessionDialogTheme({
    this.width = 512.0,
    this.padding = const EdgeInsets.all(8.0),
    this.searchResultsHeightFactor = 0.5,
    this.searchBarHeight = 32.0,
    this.searchResultsPadding = const EdgeInsets.only(top: 8.0),
    this.searchResultHeight = 28.0,
    this.selectedSearchResultDecoration = const BoxDecoration(
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
    this.unselectedSearchResultDecoration = const BoxDecoration(),
    this.searchResultTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.searchResultIconPadding = const EdgeInsets.only(right: 8.0, left: 2.0),
    this.searchResultIconSize = 21.0,
    this.searchResultFadeDuration = const Duration(milliseconds: 100),
    this.unselectedSearchResultOpacity = 0.5,
    this.noMatchingResultsTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
  });

  @override
  List<Object?> get props => [
        width,
        padding,
        searchResultsHeightFactor,
        searchBarHeight,
        searchResultsPadding,
        searchResultHeight,
        selectedSearchResultDecoration,
        unselectedSearchResultDecoration,
        searchResultTextStyle,
        searchResultIconPadding,
        searchResultIconSize,
        searchResultFadeDuration,
        unselectedSearchResultOpacity,
        noMatchingResultsTextStyle,
      ];

  static CreateTestSessionDialogTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return CreateTestSessionDialogTheme(
      padding: _getPaddingFromLayout(parameters.layout),
      searchBarHeight: _getSearchBarHeightFromLayout(parameters.layout),
      searchResultsPadding:
          _getSearchResultsPaddingFromLayout(parameters.layout),
      searchResultHeight: _getSearchResultHeightFromLayout(parameters.layout),
      selectedSearchResultDecoration:
          _getSelectedSearchResultDecorationFromBrightness(
              parameters.brightness),
      searchResultTextStyle:
          _getSearchResultTextStyleFromBrightness(parameters.brightness),
      searchResultIconSize:
          _getSearchResultIconSizeFromLayout(parameters.layout),
      searchResultFadeDuration: _getSearchResultFadeDurationFromAnimationSpeed(
          parameters.animationSpeed),
      noMatchingResultsTextStyle:
          _getNoMatchingResultsTextStyleFromBrightness(parameters.brightness),
    );
  }

  static EdgeInsets _getPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(5.5);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(11.5);
    }
  }

  static double _getSearchBarHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 32.0;
      case Layout.cozy:
        return 48.0;
    }
  }

  static EdgeInsets _getSearchResultsPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.only(top: 5.5);
      case Layout.normal:
        return const EdgeInsets.only(top: 8.0);
      case Layout.cozy:
        return const EdgeInsets.only(top: 11.5);
    }
  }

  static double _getSearchResultHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 28.0;
      case Layout.cozy:
        return 32.0;
    }
  }

  static BoxDecoration _getSelectedSearchResultDecorationFromBrightness(
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

  static TextStyle _getSearchResultTextStyleFromBrightness(
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

  static double _getSearchResultIconSizeFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 18.0;
      case Layout.normal:
        return 21.0;
      case Layout.cozy:
        return 24.0;
    }
  }

  static Duration _getSearchResultFadeDurationFromAnimationSpeed(
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

  static TextStyle _getNoMatchingResultsTextStyleFromBrightness(
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

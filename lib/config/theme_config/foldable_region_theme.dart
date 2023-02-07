import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

class FoldableRegionTheme extends Equatable {
  const FoldableRegionTheme({
    this.animationDuration = const Duration(milliseconds: 300),
    this.contentAlignment = Alignment.bottomLeft,
    this.headerHeight = 24.0,
    this.foldedHeaderOpacity = 0.75,
    this.headerColor = const Color.fromRGBO(70, 79, 90, 1.0),
    this.chevronIconColor = Colors.white,
    this.chevronIconSize = 18.0,
    this.headingStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    this.headingOverflow = TextOverflow.ellipsis,
    this.indentationAmount = 12.0,
  });

  /// The animation duration of foldable regions.
  final Duration animationDuration;

  /// The alignment of a foldable region's content during the fold/unfold
  /// animation.
  final Alignment contentAlignment;

  /// The height of a foldable region's header.
  final double headerHeight;

  /// The opacity of a foldable region's header when it is folded.
  final double foldedHeaderOpacity;

  /// A foldable region's header color.
  final Color headerColor;

  /// The color of a foldable region's chevron icon.
  final Color chevronIconColor;

  /// The size of a foldable region's chevron icon.
  final double chevronIconSize;

  /// The text style of a foldable region's heading.
  final TextStyle headingStyle;

  /// The foldable region's header's overflow.
  final TextOverflow headingOverflow;

  /// The indentation amount in foldable regions.
  final double indentationAmount;

  @override
  List<Object?> get props => [
        animationDuration,
        contentAlignment,
        headerHeight,
        foldedHeaderOpacity,
        headerColor,
        chevronIconColor,
        chevronIconSize,
        headingStyle,
        headingOverflow,
        indentationAmount,
      ];

  static FoldableRegionTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return FoldableRegionTheme(
      animationDuration:
          _getAnimationDurationFromAnimationSpeed(parameters.animationSpeed),
      headerHeight: _getHeaderHeightFromLayout(parameters.layout),
      headerColor: _getHeaderColor(parameters),
      chevronIconColor:
          _getForegroundColorFromBrightness(parameters.brightness),
      chevronIconSize: _getChevronIconSizeFromLayout(parameters.layout),
      headingStyle: _getHeadingStyle(parameters),
      indentationAmount: _getIndentationAmountFromLayout(parameters.layout),
    );
  }

  static Duration _getAnimationDurationFromAnimationSpeed(
    AnimationSpeed animationSpeed,
  ) {
    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 150);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 300);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 600);
    }
  }

  static double _getHeaderHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 16.0;
      case Layout.normal:
        return 24.0;
      case Layout.cozy:
        return 32.0;
    }
  }

  static Color _getHeaderColor(ThemeGeneratorParameters parameters) {
    if (parameters.brightness == Brightness.dark) {
      return parameters.filteredBackgroundColor.lighter(16);
    }

    return parameters.filteredBackgroundColor.darker(16);
  }

  static Color _getForegroundColorFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? Colors.white
        : const Color.fromRGBO(0, 0, 0, 0.7);
  }

  static double _getChevronIconSizeFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 16.0;
      case Layout.normal:
        return 18.0;
      case Layout.cozy:
        return 20.0;
    }
  }

  static TextStyle _getHeadingStyle(ThemeGeneratorParameters parameters) {
    return TextStyle(
      color: _getForegroundColorFromBrightness(parameters.brightness),
      fontSize: _getHeadingSizeFromLayout(parameters.layout),
      fontWeight: FontWeight.w700,
    );
  }

  static double _getHeadingSizeFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 10.0;
      case Layout.normal:
        return 12.0;
      case Layout.cozy:
        return 14.0;
    }
  }

  static double _getIndentationAmountFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 10.0;
      case Layout.normal:
        return 12.0;
      case Layout.cozy:
        return 14.0;
    }
  }
}

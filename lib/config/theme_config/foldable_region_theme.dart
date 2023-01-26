import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class FoldableRegionTheme extends Equatable {
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
      ThemeGeneratorParameters parameters) {
    return const FoldableRegionTheme();
  }
}

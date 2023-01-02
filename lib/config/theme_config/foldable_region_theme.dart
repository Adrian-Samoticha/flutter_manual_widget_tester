import 'package:flutter/material.dart';

class ManualWidgetTesterFoldableRegionTheme {
  /// The animation duration of foldable regions.
  final Duration foldableRegionAnimationDuration;

  /// The alignment of a foldable region's content during the fold/unfold
  /// animation.
  final Alignment foldableRegionContentAlignment;

  /// The height of a foldable region's header.
  final double foldableRegionHeaderHeight;

  /// The opacity of a foldable region's header when it is folded.
  final double foldableRegionFoldedHeaderOpacity;

  /// A foldable region's header color.
  final Color foldableRegionHeaderColor;

  /// The color of a foldable region's chevron icon.
  final Color foldableRegionChevronIconColor;

  /// The size of a foldable region's chevron icon.
  final double foldableRegionChevronIconSize;

  /// The text style of a foldable region's heading.
  final TextStyle foldableRegionHeadingStyle;

  /// The foldable region's header's overflow.
  final TextOverflow foldableRegionHeadingOverflow;

  /// The indentation amount in foldable regions.
  final double foldableRegionIndentationAmount;

  const ManualWidgetTesterFoldableRegionTheme({
    this.foldableRegionAnimationDuration = const Duration(milliseconds: 300),
    this.foldableRegionContentAlignment = Alignment.bottomLeft,
    this.foldableRegionHeaderHeight = 24.0,
    this.foldableRegionFoldedHeaderOpacity = 0.75,
    this.foldableRegionHeaderColor = const Color.fromRGBO(70, 79, 90, 1.0),
    this.foldableRegionChevronIconColor = Colors.white,
    this.foldableRegionChevronIconSize = 18.0,
    this.foldableRegionHeadingStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    this.foldableRegionHeadingOverflow = TextOverflow.ellipsis,
    this.foldableRegionIndentationAmount = 12.0,
  });
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_generator/theme_generator_parameters.dart';

class DoubleEditorTheme extends Equatable {
  /// The space between the text field and the double editor's infinite scroll
  /// view.
  final double spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView;

  /// The height of the double editor's infinite scroll view.
  final double infiniteScrollViewHeight;

  /// The double editor's infinite scroll view's box decoration.
  final BoxDecoration infiniteScrollViewBoxDecoration;

  /// The double editor's infinite scroll view's padding.
  final EdgeInsets infiniteScrollViewPadding;

  /// The text style of the double editor's infinite scroll view.
  final TextStyle infiniteScrollViewTextStyle;

  /// The double editor's infinite scroll view's padding amount.
  final double infiniteScrollViewTextPaddingAmount;

  /// The color of the lines in the double editor's infinite scroll view.
  final Color infiniteScrollViewLineColor;

  /// The width of the lines in the double editor's infinite scroll view.
  final double infiniteScrollViewLineWidth;

  /// The color of the indicator in the double editor's infinite scroll view.
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final Color infiniteScrollViewIndicatorColor;

  /// The width of the indicator in the double editor's infinite scroll view.
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final double infiniteScrollViewIndicatorWidth;

  /// The height of the indicator in the double editor's infinite scroll view
  /// (on a range from 0.0 to 1.0).
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final double infiniteScrollViewIndicatorHeight;

  const DoubleEditorTheme({
    this.spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView = 4.0,
    this.infiniteScrollViewHeight = 32.0,
    this.infiniteScrollViewBoxDecoration = const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      boxShadow: [
        BoxShadow(color: Color.fromRGBO(18, 20, 23, 1.0)),
        BoxShadow(
          color: Color.fromRGBO(43, 47, 54, 1.0),
          spreadRadius: -2.0,
          blurRadius: 5.5,
          offset: Offset(0.0, 1.0),
        ),
      ],
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.075),
        ),
      ),
    ),
    this.infiniteScrollViewPadding = const EdgeInsets.symmetric(vertical: 2.0),
    this.infiniteScrollViewTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    ),
    this.infiniteScrollViewTextPaddingAmount = 4.0,
    this.infiniteScrollViewLineColor = const Color.fromRGBO(255, 255, 255, 1.0),
    this.infiniteScrollViewLineWidth = 1.1,
    this.infiniteScrollViewIndicatorColor =
        const Color.fromRGBO(32, 145, 255, 1.0),
    this.infiniteScrollViewIndicatorWidth = 2.31,
    this.infiniteScrollViewIndicatorHeight = 0.75,
  });

  @override
  List<Object?> get props => [
        spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView,
        infiniteScrollViewHeight,
        infiniteScrollViewBoxDecoration,
        infiniteScrollViewPadding,
        infiniteScrollViewTextStyle,
        infiniteScrollViewTextPaddingAmount,
        infiniteScrollViewLineColor,
        infiniteScrollViewLineWidth,
        infiniteScrollViewIndicatorColor,
        infiniteScrollViewIndicatorWidth,
        infiniteScrollViewIndicatorHeight,
      ];

  static DoubleEditorTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const DoubleEditorTheme();
  }
}

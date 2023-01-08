import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterDoubleEditor extends Equatable {
  /// The space between the text field and the double editor's infinite scroll
  /// view.
  final double spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView;

  /// The height of the double editor's infinite scroll view.
  final double doubleEditorInfiniteScrollViewHeight;

  /// The double editor's infinite scroll view's box decoration.
  final BoxDecoration doubleEditorInfiniteScrollViewBoxDecoration;

  /// The double editor's infinite scroll view's padding.
  final EdgeInsets doubleEditorInfiniteScrollViewPadding;

  /// The text style of the double editor's infinite scroll view.
  final TextStyle doubleEditorInfiniteScrollViewTextStyle;

  /// The double editor's infinite scroll view's padding amount.
  final double doubleEditorInfiniteScrollViewTextPaddingAmount;

  /// The color of the lines in the double editor's infinite scroll view.
  final Color doubleEditorInfiniteScrollViewLineColor;

  /// The width of the lines in the double editor's infinite scroll view.
  final double doubleEditorInfiniteScrollViewLineWidth;

  /// The color of the indicator in the double editor's infinite scroll view.
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final Color doubleEditorInfiniteScrollViewIndicatorColor;

  /// The width of the indicator in the double editor's infinite scroll view.
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final double doubleEditorInfiniteScrollViewIndicatorWidth;

  /// The height of the indicator in the double editor's infinite scroll view
  /// (on a range from 0.0 to 1.0).
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final double doubleEditorInfiniteScrollViewIndicatorHeight;

  const ManualWidgetTesterDoubleEditor({
    this.spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView = 4.0,
    this.doubleEditorInfiniteScrollViewHeight = 32.0,
    this.doubleEditorInfiniteScrollViewBoxDecoration = const BoxDecoration(
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
    this.doubleEditorInfiniteScrollViewPadding =
        const EdgeInsets.symmetric(vertical: 2.0),
    this.doubleEditorInfiniteScrollViewTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    ),
    this.doubleEditorInfiniteScrollViewTextPaddingAmount = 4.0,
    this.doubleEditorInfiniteScrollViewLineColor =
        const Color.fromRGBO(255, 255, 255, 1.0),
    this.doubleEditorInfiniteScrollViewLineWidth = 1.1,
    this.doubleEditorInfiniteScrollViewIndicatorColor =
        const Color.fromRGBO(32, 145, 255, 1.0),
    this.doubleEditorInfiniteScrollViewIndicatorWidth = 2.31,
    this.doubleEditorInfiniteScrollViewIndicatorHeight = 0.75,
  });

  @override
  List<Object?> get props => [
        spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView,
        doubleEditorInfiniteScrollViewHeight,
        doubleEditorInfiniteScrollViewBoxDecoration,
        doubleEditorInfiniteScrollViewPadding,
        doubleEditorInfiniteScrollViewTextStyle,
        doubleEditorInfiniteScrollViewTextPaddingAmount,
        doubleEditorInfiniteScrollViewLineColor,
        doubleEditorInfiniteScrollViewLineWidth,
        doubleEditorInfiniteScrollViewIndicatorColor,
        doubleEditorInfiniteScrollViewIndicatorWidth,
        doubleEditorInfiniteScrollViewIndicatorHeight,
      ];
}

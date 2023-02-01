import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_manual_widget_tester/util/multiply_saturation.dart';

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
    return DoubleEditorTheme(
      infiniteScrollViewHeight:
          _getInfiniteScrollViewHeightFromLayout(parameters.layout),
      infiniteScrollViewBoxDecoration:
          _getInfiniteScrollViewBoxDecoration(parameters),
      infiniteScrollViewPadding:
          _getInfiniteScrollViewPaddingFromLayout(parameters.layout),
      infiniteScrollViewTextStyle: _getInfiniteScrollViewTextStyle(parameters),
      infiniteScrollViewLineColor:
          _getDefaultForegroundColorFromBrightness(parameters.brightness)
              .mix(parameters.filteredBackgroundColor, 0.2)!,
      infiniteScrollViewIndicatorColor: parameters.primaryColor.lighter(5),
    );
  }

  static double _getInfiniteScrollViewHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 32.0;
      case Layout.cozy:
        return 48.0;
    }
  }

  static BoxDecoration _getInfiniteScrollViewBoxDecoration(
      ThemeGeneratorParameters parameters) {
    return BoxDecoration(
      color: _getInfiniteScrollViewBackgroundColor(parameters),
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      boxShadow: _getInfiniteScrollViewBoxShadow(parameters),
      border: Border.fromBorderSide(
        BorderSide(
          color: _getInfiniteScrollViewBorderColorFromBrightness(
              parameters.brightness),
        ),
      ),
    );
  }

  static Color _getInfiniteScrollViewBorderColorFromBrightness(
      Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color.fromRGBO(255, 255, 255, 0.075)
        : const Color.fromRGBO(255, 255, 255, 0.29);
  }

  static Color _getInfiniteScrollViewBackgroundColor(
      ThemeGeneratorParameters parameters) {
    if (parameters.designLanguage == DesignLanguage.skeuomorphic) {
      return Colors.transparent;
    }

    return parameters.brightness == Brightness.dark
        ? parameters.filteredBackgroundColor.darker(2)
        : parameters.filteredBackgroundColor.darker(12);
  }

  static Color _getDefaultForegroundColorFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static List<BoxShadow> _getInfiniteScrollViewBoxShadow(
      ThemeGeneratorParameters parameters) {
    if (parameters.designLanguage == DesignLanguage.flat) {
      return const [];
    }

    final color1 = parameters.filteredBackgroundColor.darker(16);
    final color2 =
        HSLColor.fromColor(parameters.filteredBackgroundColor.darker(5))
            .multiplySaturation(0.67)
            .toColor();

    return [
      BoxShadow(color: color1),
      BoxShadow(
        color: color2,
        spreadRadius: -2.0,
        blurRadius: 5.5,
        offset: const Offset(0.0, 1.0),
      ),
    ];
  }

  static EdgeInsets _getInfiniteScrollViewPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.symmetric(vertical: 0.5);
      case Layout.normal:
        return const EdgeInsets.symmetric(vertical: 2.0);
      case Layout.cozy:
        return const EdgeInsets.symmetric(vertical: 2.0);
    }
  }

  static TextStyle _getInfiniteScrollViewTextStyle(
      ThemeGeneratorParameters parameters) {
    return TextStyle(
      color: _getDefaultForegroundColorFromBrightness(parameters.brightness),
      fontSize: _getTextSizeFromLayout(parameters.layout),
    );
  }

  static double _getTextSizeFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 10.0;
      case Layout.normal:
        return 12.0;
      case Layout.cozy:
        return 16.0;
    }
  }
}

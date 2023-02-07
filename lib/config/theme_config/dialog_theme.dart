import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

class DialogTheme extends Equatable {
  const DialogTheme({
    this.backgroundColor = const Color.fromRGBO(38, 39, 47, 0.75),
    this.barrierColor = const Color.fromRGBO(0, 0, 0, 0.35),
    this.openCloseAnimationDuration = const Duration(milliseconds: 150),
    this.openCloseAnimationCurve = Curves.easeInOutSine,
    this.openCloseAnimationOffset = const Offset(0.0, -16.0),
    this.alignment = Alignment.center,
    this.blurRadius = 16.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(5.0)),
    this.borderColor = const Color.fromRGBO(255, 255, 255, 0.025),
    this.shadow = const [
      BoxShadow(
        blurRadius: 8.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
        spreadRadius: 4.0,
        offset: Offset(0.0, 4.0),
      ),
    ],
    this.padding = const EdgeInsets.all(8.0),
    this.actionButtonHeight = 32.0,
    this.actionButtonSectionBackgroundColor =
        const Color.fromRGBO(16, 18, 21, 0.5),
    this.baseActionButtonRowWidth = 192.0,
    this.customDialogActionButtonWidthAddition = 32.0,
    this.distanceBetweenContentAndActionButtons = 8.0,
  });

  /// A dialog's background color.
  final Color backgroundColor;

  /// The color of a dialog's barrier.
  final Color barrierColor;

  /// The duration of a dialog's open/close animation.
  final Duration openCloseAnimationDuration;

  /// The animation curve of a dialog's open/close animation.
  final Curve openCloseAnimationCurve;

  /// The offset of the dialog's open/close animation.
  final Offset openCloseAnimationOffset;

  /// The alignment of a dialog box.
  final Alignment alignment;

  /// The blur radius of a dialog's backdrop effect.
  final double blurRadius;

  /// The border radius of a dialog box.
  final BorderRadius borderRadius;

  /// The border color of a dialog box.
  final Color borderColor;

  /// The shadow(s) of a dialog box.
  final List<BoxShadow> shadow;

  /// The padding of a dialog box.
  final EdgeInsets padding;

  /// The height of the buttons in the dialog box's action button row.
  final double actionButtonHeight;

  /// The background color of the section in which the dialog's action buttons
  /// are located.
  final Color actionButtonSectionBackgroundColor;

  /// The base width of a dialog's action button row, upon which
  /// `customDialogActionButtonWidthAddition` gets added for each action button.
  final double baseActionButtonRowWidth;

  /// The amount to add to the default action button row width for each action
  /// button.
  final double customDialogActionButtonWidthAddition;

  /// The distance between the dialog's content and its action button row.
  final double distanceBetweenContentAndActionButtons;

  @override
  List<Object?> get props => [
        backgroundColor,
        barrierColor,
        openCloseAnimationDuration,
        openCloseAnimationCurve,
        openCloseAnimationOffset,
        alignment,
        blurRadius,
        borderRadius,
        borderColor,
        shadow,
        padding,
        actionButtonHeight,
        actionButtonSectionBackgroundColor,
        baseActionButtonRowWidth,
        customDialogActionButtonWidthAddition,
        distanceBetweenContentAndActionButtons,
      ];

  static DialogTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return DialogTheme(
      backgroundColor: _getBackgroundColorFromParameters(parameters),
      openCloseAnimationDuration:
          _getOpenCloseAnimationDurationFromAnimationSpeed(
        parameters.animationSpeed,
      ),
      blurRadius: _getBlurRadiusFromDesignLanguage(parameters.designLanguage),
      borderColor: _getBorderColorFromBrightness(parameters.brightness),
      padding: _getPaddingFromLayout(parameters.layout),
      actionButtonHeight: _getActionButtonHeightFromLayout(parameters.layout),
      actionButtonSectionBackgroundColor:
          _getActionButtonSectionBackgroundColor(parameters),
      distanceBetweenContentAndActionButtons:
          _getDistanceBetweenContentAndActionButtonsFromLayout(
        parameters.layout,
      ),
    );
  }

  static Color _getBackgroundColorFromParameters(
    ThemeGeneratorParameters parameters,
  ) {
    final opacity =
        parameters.designLanguage == DesignLanguage.skeuomorphic ? 0.75 : 1.0;

    if (parameters.brightness == Brightness.dark) {
      return parameters.filteredBackgroundColor
          .lighter(16)
          .withOpacity(opacity);
    }

    return parameters.filteredBackgroundColor.darker(2).withOpacity(opacity);
  }

  static Duration _getOpenCloseAnimationDurationFromAnimationSpeed(
    AnimationSpeed animationSpeed,
  ) {
    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 80);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 150);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 300);
    }
  }

  static double _getBlurRadiusFromDesignLanguage(
    DesignLanguage designLanguage,
  ) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return 16.0;
      case DesignLanguage.flat:
        return 0.0;
    }
  }

  static Color _getBorderColorFromBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const Color.fromRGBO(255, 255, 255, 0.025);
      case Brightness.light:
        return const Color.fromRGBO(0, 0, 0, 0.025);
    }
  }

  static EdgeInsets _getPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(4.0);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(12.0);
    }
  }

  static double _getActionButtonHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 32.0;
      case Layout.cozy:
        return 48.0;
    }
  }

  static Color _getActionButtonSectionBackgroundColor(
    ThemeGeneratorParameters parameters,
  ) {
    if (parameters.brightness == Brightness.dark) {
      return parameters.filteredBackgroundColor.lighter(24).withOpacity(0.5);
    }

    return parameters.filteredBackgroundColor.darker(24).withOpacity(0.5);
  }

  static double _getDistanceBetweenContentAndActionButtonsFromLayout(
    Layout layout,
  ) {
    switch (layout) {
      case Layout.compact:
        return 4.0;
      case Layout.normal:
        return 8.0;
      case Layout.cozy:
        return 12.0;
    }
  }
}

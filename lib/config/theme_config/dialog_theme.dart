import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterDialogTheme extends Equatable {
  /// A dialog's background color.
  final Color dialogBackgroundColor;

  /// The color of a dialog's barrier.
  final Color dialogBarrierColor;

  /// The duration of a dialog's open/close animation.
  final Duration dialogOpenCloseAnimationDuration;

  /// The animation curve of a dialog's open/close animation.
  final Curve dialogOpenCloseAnimationCurve;

  /// The offset of the dialog's open/close animation.
  final Offset dialogOpenCloseAnimationOffset;

  /// The alignment of a dialog box.
  final Alignment dialogAlignment;

  /// The blur radius of a dialog's backdrop effect.
  final double dialogBlurRadius;

  /// The border radius of a dialog box.
  final BorderRadius dialogBorderRadius;

  /// The border color of a dialog box.
  final Color dialogBorderColor;

  /// The shadow(s) of a dialog box.
  final List<BoxShadow> dialogShadow;

  /// The padding of a dialog box.
  final EdgeInsets dialogPadding;

  /// The height of the buttons in the dialog box's action button row.
  final double dialogActionButtonHeight;

  /// The background color of the section in which the dialog's action buttons
  /// are located.
  final Color dialogActionButtonSectionBackgroundColor;

  /// The base width of a dialog's action button row, upon which
  /// `customDialogActionButtonWidthAddition` gets added for each action button.
  final double baseDialogActionButtonRowWidth;

  /// The amount to add to the default action button row width for each action
  /// button.
  final double customDialogActionButtonWidthAddition;

  /// The distance between the dialog's content and its action button row.
  final double distanceBetweenDialogContentAndActionButtons;

  const ManualWidgetTesterDialogTheme({
    this.dialogBackgroundColor = const Color.fromRGBO(38, 39, 47, 0.75),
    this.dialogBarrierColor = const Color.fromRGBO(0, 0, 0, 0.35),
    this.dialogOpenCloseAnimationDuration = const Duration(milliseconds: 150),
    this.dialogOpenCloseAnimationCurve = Curves.easeInOutSine,
    this.dialogOpenCloseAnimationOffset = const Offset(0.0, -16.0),
    this.dialogAlignment = Alignment.center,
    this.dialogBlurRadius = 16.0,
    this.dialogBorderRadius = const BorderRadius.all(Radius.circular(5.0)),
    this.dialogBorderColor = const Color.fromRGBO(255, 255, 255, 0.025),
    this.dialogShadow = const [
      BoxShadow(
        blurRadius: 8.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
        spreadRadius: 4.0,
        offset: Offset(0.0, 4.0),
      ),
    ],
    this.dialogPadding = const EdgeInsets.all(8.0),
    this.dialogActionButtonHeight = 32.0,
    this.dialogActionButtonSectionBackgroundColor =
        const Color.fromRGBO(16, 18, 21, 0.5),
    this.baseDialogActionButtonRowWidth = 192.0,
    this.customDialogActionButtonWidthAddition = 32.0,
    this.distanceBetweenDialogContentAndActionButtons = 8.0,
  });

  @override
  List<Object?> get props => [
        dialogBackgroundColor,
        dialogBarrierColor,
        dialogOpenCloseAnimationDuration,
        dialogOpenCloseAnimationCurve,
        dialogOpenCloseAnimationOffset,
        dialogAlignment,
        dialogBlurRadius,
        dialogBorderRadius,
        dialogBorderColor,
        dialogShadow,
        dialogPadding,
        dialogActionButtonHeight,
        dialogActionButtonSectionBackgroundColor,
        baseDialogActionButtonRowWidth,
        customDialogActionButtonWidthAddition,
        distanceBetweenDialogContentAndActionButtons,
      ];

  static ManualWidgetTesterDialogTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterDialogTheme(
      dialogBackgroundColor:
          _getDialogBackgroundColorFromParameters(parameters),
      dialogOpenCloseAnimationDuration:
          _getDialogOpenCloseAnimationDurationFromAnimationSpeed(
              parameters.animationSpeed),
      dialogBlurRadius:
          _getDialogBlurRadiusFromDesignLanguage(parameters.designLanguage),
      dialogBorderColor:
          _getDialogBorderColorFromBrightness(parameters.brightness),
      dialogPadding: _getDialogPaddingFromLayout(parameters.layout),
      dialogActionButtonHeight:
          _getDialogActionButtonHeightFromLayout(parameters.layout),
      dialogActionButtonSectionBackgroundColor:
          _getDialogActionButtonSectionBackgroundColor(parameters),
      distanceBetweenDialogContentAndActionButtons:
          _getDistanceBetweenDialogContentAndActionButtonsFromLayout(
              parameters.layout),
    );
  }

  static Color _getDialogBackgroundColorFromParameters(
      ThemeGeneratorParameters parameters) {
    final opacity =
        parameters.designLanguage == DesignLanguage.skeuomorphic ? 0.75 : 1.0;

    if (parameters.brightness == Brightness.dark) {
      return parameters.filteredBackgroundColor
          .lighter(16)
          .withOpacity(opacity);
    }

    return parameters.filteredBackgroundColor.darker(32).withOpacity(opacity);
  }

  static Duration _getDialogOpenCloseAnimationDurationFromAnimationSpeed(
      AnimationSpeed animationSpeed) {
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

  static double _getDialogBlurRadiusFromDesignLanguage(
      DesignLanguage designLanguage) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return 16.0;
      case DesignLanguage.flat:
        return 0.0;
    }
  }

  static Color _getDialogBorderColorFromBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const Color.fromRGBO(255, 255, 255, 0.025);
      case Brightness.light:
        return const Color.fromRGBO(0, 0, 0, 0.025);
    }
  }

  static EdgeInsets _getDialogPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(4.0);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(12.0);
    }
  }

  static double _getDialogActionButtonHeightFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 32.0;
      case Layout.cozy:
        return 48.0;
    }
  }

  static Color _getDialogActionButtonSectionBackgroundColor(
      ThemeGeneratorParameters parameters) {
    if (parameters.brightness == Brightness.dark) {
      return parameters.filteredBackgroundColor.lighter(24).withOpacity(0.5);
    }

    return parameters.filteredBackgroundColor.darker(24).withOpacity(0.5);
  }

  static double _getDistanceBetweenDialogContentAndActionButtonsFromLayout(
      Layout layout) {
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

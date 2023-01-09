import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
}

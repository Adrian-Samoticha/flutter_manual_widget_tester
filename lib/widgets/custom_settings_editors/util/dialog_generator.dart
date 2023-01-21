import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/multiply_opacity.dart';
import 'package:num_remap/num_remap.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';

class ManualWidgetTesterDialogGenerator {
  /// Shows a dialog that displays a custom setting editor that is built via a
  /// provided [editorBuilder]. By default, the window has two actions buttons,
  /// one for canceling the setting and one for applying it. When a button is
  /// pressed, the [onCancel] and [onApply] callbacks are triggered
  /// respectively. Optionally, additional action buttons can be supplied via
  /// the [customActionButtons] argument. These action buttons will then be
  /// positioned between the “Cancel” and “Apply” buttons.
  static void showEditSettingDialog({
    required BuildContext context,
    required Widget Function(BuildContext) editorBuilder,
    double dialogWidth = 512.0,
    void Function()? onCancel,
    required void Function()? onApply,
    void Function()? onClose,
    List<ManualWidgetTesterButtonInfo> customActionButtons = const [],
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor:
          ManualWidgetTesterTheme.of(context).dialogTheme.dialogBarrierColor,
      transitionDuration: ManualWidgetTesterTheme.of(context)
          .dialogTheme
          .dialogOpenCloseAnimationDuration,
      transitionBuilder: (BuildContext _, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget widget) {
        final curvedAnimationValue = ManualWidgetTesterTheme.of(context)
            .dialogTheme
            .dialogOpenCloseAnimationCurve
            .transform(animation.value);

        // Unfortunately, the BackdropFilter Widget cannot be combined with the
        // Opacity widget to create a dialog open/close animation. So instead,
        // this code fades the background color to full opacity to hide the
        // point at which the BackdropFilter is enabled/disabled.
        final originalDialogBackgroundColor =
            ManualWidgetTesterTheme.of(context)
                .dialogTheme
                .dialogBackgroundColor;
        final renderedDialogBackgroundColor =
            _getRenderedBackgroundColorFromOriginalBackgroundColor(
                curvedAnimationValue, originalDialogBackgroundColor);

        final doEnableBlur = curvedAnimationValue >= 0.5;

        return Transform.translate(
          offset: ManualWidgetTesterTheme.of(context)
                  .dialogTheme
                  .dialogOpenCloseAnimationOffset *
              (1.0 - curvedAnimationValue),
          child: Align(
            alignment:
                ManualWidgetTesterTheme.of(context).dialogTheme.dialogAlignment,
            child: _buildDialogWindow(
                context,
                dialogWidth,
                renderedDialogBackgroundColor,
                curvedAnimationValue,
                doEnableBlur,
                widget),
          ),
        );
      },
      pageBuilder: (BuildContext _, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Theme(
          data: ManualWidgetTesterTheme.of(context).generalTheme.isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          child: DefaultTextStyle(
            style: DefaultTextStyleProvider.defaultTextStyle,
            child: ManualWidgetTesterTheme(
              themeData: ManualWidgetTesterTheme.of(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: ManualWidgetTesterTheme.of(context)
                        .dialogTheme
                        .dialogPadding
                        .copyWith(
                          bottom: 0.0,
                        ),
                    child: editorBuilder(context),
                  ),
                  SizedBox(
                    height: ManualWidgetTesterTheme.of(context)
                        .dialogTheme
                        .distanceBetweenDialogContentAndActionButtons,
                  ),
                  _buildActionButtonRow(
                      context, onApply, onCancel, customActionButtons),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      if (onClose != null) {
        onClose();
      }
    });
  }

  static Color _getRenderedBackgroundColorFromOriginalBackgroundColor(
      double curvedAnimationValue, Color originalDialogBackgroundColor) {
    if (curvedAnimationValue >= 0.5) {
      return originalDialogBackgroundColor.withOpacity(curvedAnimationValue
          .remap(0.5, 1.0, 1.0, originalDialogBackgroundColor.opacity));
    } else {
      return originalDialogBackgroundColor
          .withOpacity(curvedAnimationValue.remap(0.0, 0.5, 0.0, 1.0));
    }
  }

  static Widget _buildDialogWindow(
      BuildContext context,
      double dialogWidth,
      Color renderedDialogBackgroundColor,
      double curvedAnimationValue,
      bool doEnableBlur,
      Widget widget) {
    return Container(
      width: dialogWidth,
      decoration: BoxDecoration(
        boxShadow: ManualWidgetTesterTheme.of(context)
            .dialogTheme
            .dialogShadow
            .map((BoxShadow boxShadow) {
          return BoxShadow(
            blurRadius: boxShadow.blurRadius,
            color: boxShadow.color.multiplyOpacity(curvedAnimationValue),
            blurStyle: boxShadow.blurStyle,
            offset: boxShadow.offset,
            spreadRadius: boxShadow.spreadRadius,
          );
        }).toList(),
      ),
      child: ClipRRect(
        borderRadius:
            ManualWidgetTesterTheme.of(context).dialogTheme.dialogBorderRadius,
        child: BackdropFilter(
          filter: doEnableBlur
              ? ImageFilter.blur(
                  sigmaX: ManualWidgetTesterTheme.of(context)
                      .dialogTheme
                      .dialogBlurRadius,
                  sigmaY: ManualWidgetTesterTheme.of(context)
                      .dialogTheme
                      .dialogBlurRadius)
              : ImageFilter.blur(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: ManualWidgetTesterTheme.of(context)
                  .dialogTheme
                  .dialogBorderRadius,
              color: renderedDialogBackgroundColor,
              border: Border.fromBorderSide(
                BorderSide(
                    color: ManualWidgetTesterTheme.of(context)
                        .dialogTheme
                        .dialogBorderColor
                        .multiplyOpacity(curvedAnimationValue)),
              ),
            ),
            child: Opacity(
              opacity: curvedAnimationValue,
              child: widget,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildActionButtonRow(
      BuildContext context,
      void Function()? onApply,
      void Function()? onCancel,
      List<ManualWidgetTesterButtonInfo> customButtons) {
    return Container(
      color: ManualWidgetTesterTheme.of(context)
          .dialogTheme
          .dialogActionButtonSectionBackgroundColor,
      padding: ManualWidgetTesterTheme.of(context)
          .dialogTheme
          .dialogPadding
          .copyWith(
            top: ManualWidgetTesterTheme.of(context)
                .dialogTheme
                .dialogPadding
                .bottom,
          ),
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            height: ManualWidgetTesterTheme.of(context)
                .dialogTheme
                .dialogActionButtonHeight,
            width: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .baseDialogActionButtonRowWidth +
                ManualWidgetTesterTheme.of(context)
                        .dialogTheme
                        .customDialogActionButtonWidthAddition *
                    customButtons.length,
            child: ManualWidgetTesterButtonRow(
              buttons: [
                ManualWidgetTesterButtonInfo(
                  onButtonDown: null,
                  onButtonPressed: () {
                    if (onCancel != null) {
                      onCancel();
                    }
                    Navigator.maybePop(context);
                  },
                  child: const Center(child: Text('Cancel')),
                ),
                ...customButtons,
                ManualWidgetTesterButtonInfo(
                  onButtonDown: null,
                  onButtonPressed: onApply == null
                      ? null
                      : () {
                          onApply();
                          Navigator.maybePop(context);
                        },
                  child: const Center(child: Text('Apply')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

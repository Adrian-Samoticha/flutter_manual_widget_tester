import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
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
    required ManualWidgetTesterThemeSettings themeSettings,
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
      barrierColor: themeSettings.dialogBarrierColor,
      transitionDuration: themeSettings.dialogOpenCloseAnimationDuration,
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget widget) {
        final curvedAnimationValue = themeSettings.dialogOpenCloseAnimationCurve
            .transform(animation.value);

        // Unfortunately, the BackdropFilter Widget cannot be combined with the
        // Opacity widget to create a dialog open/close animation. So instead,
        // this code fades the background color to full opacity to hide the
        // point at which the BackdropFilter is enabled/disabled.
        final originalDialogBackgroundColor =
            themeSettings.dialogBackgroundColor;
        final renderedDialogBackgroundColor =
            _getRenderedBackgroundColorFromOriginalBackgroundColor(
                curvedAnimationValue, originalDialogBackgroundColor);

        final doEnableBlur = curvedAnimationValue >= 0.5;

        return Transform.translate(
          offset: themeSettings.dialogOpenCloseAnimationOffset *
              (1.0 - curvedAnimationValue),
          child: Align(
            alignment: themeSettings.dialogAlignment,
            child: _buildDialogWindow(
                dialogWidth,
                themeSettings,
                renderedDialogBackgroundColor,
                curvedAnimationValue,
                doEnableBlur,
                widget),
          ),
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DefaultTextStyle(
          style: DefaultTextStyleProvider.defaultTextStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: themeSettings.dialogPadding.copyWith(
                  bottom: 0.0,
                ),
                child: editorBuilder(context),
              ),
              SizedBox(
                  height: themeSettings
                      .distanceBetweenDialogContentAndActionButtons),
              _buildActionButtonRow(themeSettings, context, onApply, onCancel,
                  customActionButtons),
            ],
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
      double dialogWidth,
      ManualWidgetTesterThemeSettings themeSettings,
      Color renderedDialogBackgroundColor,
      double curvedAnimationValue,
      bool doEnableBlur,
      Widget widget) {
    return Container(
      width: dialogWidth,
      decoration: BoxDecoration(
        borderRadius: themeSettings.dialogBorderRadius,
        color: renderedDialogBackgroundColor,
        border: Border.fromBorderSide(
          BorderSide(
              color: themeSettings.dialogBorderColor
                  .multiplyOpacity(curvedAnimationValue)),
        ),
        boxShadow: themeSettings.dialogShadow.map((BoxShadow boxShadow) {
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
        borderRadius: themeSettings.dialogBorderRadius,
        child: BackdropFilter(
          filter: doEnableBlur
              ? ImageFilter.blur(
                  sigmaX: themeSettings.dialogBlurRadius,
                  sigmaY: themeSettings.dialogBlurRadius)
              : ImageFilter.blur(),
          child: Opacity(
            opacity: curvedAnimationValue,
            child: widget,
          ),
        ),
      ),
    );
  }

  static Widget _buildActionButtonRow(
      ManualWidgetTesterThemeSettings themeSettings,
      BuildContext context,
      void Function()? onApply,
      void Function()? onCancel,
      List<ManualWidgetTesterButtonInfo> customButtons) {
    return Container(
      color: themeSettings.dialogActionButtonSectionBackgroundColor,
      padding: themeSettings.dialogPadding.copyWith(
        top: themeSettings.dialogPadding.bottom,
      ),
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            height: themeSettings.dialogActionButtonHeight,
            width: themeSettings.baseDialogActionButtonRowWidth +
                themeSettings.customDialogActionButtonWidthAddition *
                    customButtons.length,
            child: ManualWidgetTesterButtonRow(
              themeSettings: themeSettings,
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

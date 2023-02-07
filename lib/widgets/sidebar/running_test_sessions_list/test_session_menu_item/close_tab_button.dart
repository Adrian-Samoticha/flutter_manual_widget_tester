import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/close_button.dart';

class CloseTabButton extends StatelessWidget {
  const CloseTabButton({
    super.key,
    required this.tweenValue,
    required this.onPressed,
  });

  final double tweenValue;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: tweenValue, end: tweenValue),
      curve: Curves.decelerate,
      builder: (BuildContext context, double value, Widget? child) {
        return Align(
          widthFactor: value,
          child: Opacity(
            opacity: value,
            child: Padding(
              padding: ManualWidgetTesterTheme.of(context)
                  .testSessionMenuItemTheme
                  .closeButtonPadding,
              child: child,
            ),
          ),
        );
      },
      child: SizedBox(
        width: ManualWidgetTesterTheme.of(context)
            .testSessionMenuItemTheme
            .closeButtonSize,
        height: ManualWidgetTesterTheme.of(context)
            .testSessionMenuItemTheme
            .closeButtonSize,
        child: ManualWidgetTesterCloseButton(
          onPressed: onPressed,
          size: ManualWidgetTesterTheme.of(context)
              .testSessionMenuItemTheme
              .closeButtonSize,
        ),
      ),
    );
  }
}

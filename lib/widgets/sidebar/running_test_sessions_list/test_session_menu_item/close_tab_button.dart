import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/close_button.dart';

class CloseTabButton extends StatelessWidget {
  const CloseTabButton({
    Key? key,
    required this.themeSettings,
    required this.tweenValue,
    required this.onPressed,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
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
              padding: themeSettings.testSessionMenuItemCloseButtonPadding,
              child: child,
            ),
          ),
        );
      },
      child: SizedBox(
        width: themeSettings.testSessionMenuItemCloseButtonSize,
        height: themeSettings.testSessionMenuItemCloseButtonSize,
        child: ManualWidgetTesterCloseButton(
          themeSettings: themeSettings,
          onPressed: onPressed,
          size: themeSettings.testSessionMenuItemCloseButtonSize,
        ),
      ),
    );
  }
}

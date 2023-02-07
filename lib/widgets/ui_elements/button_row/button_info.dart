import 'package:flutter/widgets.dart';

class ManualWidgetTesterButtonInfo {
  ManualWidgetTesterButtonInfo({
    required this.onButtonDown,
    required this.onButtonPressed,
    this.child = const SizedBox(),
  });

  final void Function()? onButtonDown;
  final void Function()? onButtonPressed;
  final Widget child;
}

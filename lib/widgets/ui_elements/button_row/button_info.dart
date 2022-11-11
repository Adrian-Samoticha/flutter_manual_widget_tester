import 'package:flutter/widgets.dart';

class ManualWidgetTesterButtonInfo {
  final void Function()? onButtonDown;
  final void Function()? onButtonPressed;
  final Widget child;

  ManualWidgetTesterButtonInfo(
      {required this.onButtonDown,
      required this.onButtonPressed,
      this.child = const SizedBox()});
}

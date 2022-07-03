import 'package:flutter/widgets.dart';

class WidgetTestSession {
  WidgetTestSession({this.widget = const SizedBox(), this.name = 'unnamed', this.icon, this.iconColor}) : key = UniqueKey(),
    assert(iconColor == null || icon != null, 'iconColor must be null if icon is null.');
  
  final Key key;
  final Widget widget;
  final String name;
  final IconData? icon;
  final Color? iconColor;
}
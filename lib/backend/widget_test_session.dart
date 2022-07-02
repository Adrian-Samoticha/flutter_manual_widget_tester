import 'package:flutter/widgets.dart';

class WidgetTestSession {
  WidgetTestSession({this.widget = const SizedBox(), this.name = 'unnamed'}) : key = UniqueKey();
  
  final Key key;
  final Widget widget;
  final String name;
}
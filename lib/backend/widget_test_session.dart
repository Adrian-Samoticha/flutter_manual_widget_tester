import 'package:flutter/widgets.dart';

class WidgetTestSession {
  WidgetTestSession({this.widget = const SizedBox(), this.name = 'unnamed'});
  
  final Widget widget;
  final String name;
}
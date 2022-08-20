import 'package:flutter/widgets.dart';

import 'widget_test_session_custom_settings.dart';

class WidgetTestBuilder {
  WidgetTestBuilder({required this.id, required this.builder, this.name = 'unnamed', this.icon, this.iconColor}) :
    assert(iconColor == null || icon != null, 'iconColor must be null if icon is null.'),
    assert(id is! UniqueKey, 'id may not be a UniqueKey.');
  
  final Object id;
  final Widget Function(BuildContext, WidgetTestSessionCustomSettings) builder;
  final String name;
  final IconData? icon;
  final Color? iconColor;
}
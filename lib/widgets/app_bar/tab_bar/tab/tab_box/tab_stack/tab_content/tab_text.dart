import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class TabText extends StatelessWidget {
  const TabText({
    Key? key,
    required this.widgetName,
    required this.isFocused,
    required this.isBeingHovered,
  }) : super(key: key);

  final String widgetName;
  final bool isFocused;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isFocused) {
      return Center(
          child: Text(
        widgetName,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: ManualWidgetTesterTheme.of(context).tabTheme.tabTextStyle,
      ));
    }

    return Center(
        child: AnimatedOpacity(
      duration: ManualWidgetTesterTheme.of(context)
          .tabTheme
          .unfocusedTabOpacityChangeDuration,
      opacity: isBeingHovered
          ? ManualWidgetTesterTheme.of(context)
              .tabTheme
              .unfocusedHoveredTabOpacity
          : ManualWidgetTesterTheme.of(context)
              .tabTheme
              .unfocusedNotHoveredTabOpacity,
      child: Text(
        widgetName,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: ManualWidgetTesterTheme.of(context).tabTheme.tabTextStyle,
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class FocusedTabDecoration extends StatelessWidget {
  const FocusedTabDecoration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManualWidgetTesterTheme.of(context)
          .tabTheme
          .focusedTabAccentColorDecorationWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ManualWidgetTesterTheme.of(context)
              .tabTheme
              .focusedTabAccentColorDecorationWidth),
          bottomRight: Radius.circular(ManualWidgetTesterTheme.of(context)
              .tabTheme
              .focusedTabAccentColorDecorationWidth),
        ),
        color: ManualWidgetTesterTheme.of(context).generalTheme.accentColor,
      ),
    );
  }
}

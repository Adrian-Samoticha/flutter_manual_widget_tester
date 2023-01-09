import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class TabSeparator extends StatelessWidget {
  const TabSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      decoration: ManualWidgetTesterTheme.of(context)
          .tabTheme
          .tabSeparatorBoxDecoration,
    );
  }
}

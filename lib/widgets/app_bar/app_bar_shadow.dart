import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

/// A container that simulates the shadow of the widget test area.
class AppBarShadow extends StatelessWidget {
  const AppBarShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: ManualWidgetTesterTheme.of(context).appBarTheme.shadowHeight,
        decoration:
            ManualWidgetTesterTheme.of(context).appBarTheme.shadowBoxDecoration,
      ),
    );
  }
}

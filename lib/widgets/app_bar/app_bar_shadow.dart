import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

/// A container that simulates the shadow of the widget test area.
class AppBarShadow extends StatelessWidget {
  const AppBarShadow({
    Key? key,
    required this.themeSettings,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: themeSettings.appBarShadowHeight,
        decoration: themeSettings.appBarShadowBoxDecoration,
      ),
    );
  }
}

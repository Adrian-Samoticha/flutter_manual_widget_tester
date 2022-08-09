import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class GenericSettings extends StatelessWidget {
  const GenericSettings({Key? key, required this.themeSettings}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      isIndented: true,
      heading: 'GENERIC SETTINGS',
      themeSettings: themeSettings,
      child: Container(),
    );
  }
}
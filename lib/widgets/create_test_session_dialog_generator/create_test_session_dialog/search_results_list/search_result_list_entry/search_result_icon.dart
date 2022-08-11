import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class SearchResultIcon extends StatelessWidget {
  const SearchResultIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.themeSettings,
  }) : super(key: key);

  final IconData icon;
  final Color? iconColor;
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.createTestSessionDialogSearchResultIconPadding,
      child: Icon(
        icon,
        size: themeSettings.createTestSessionDialogSearchResultIconSize,
        color: iconColor,
      ),
    );
  }
}
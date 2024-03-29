import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class SearchResultIcon extends StatelessWidget {
  const SearchResultIcon({
    super.key,
    required this.icon,
    required this.iconColor,
  });

  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context)
          .createTestSessionDialogTheme
          .searchResultIconPadding,
      child: Icon(
        icon,
        size: ManualWidgetTesterTheme.of(context)
            .createTestSessionDialogTheme
            .searchResultIconSize,
        color: iconColor,
      ),
    );
  }
}

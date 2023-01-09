import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class SearchResultIcon extends StatelessWidget {
  const SearchResultIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context)
          .createTestSessionDialogTheme
          .createTestSessionDialogSearchResultIconPadding,
      child: Icon(
        icon,
        size: ManualWidgetTesterTheme.of(context)
            .createTestSessionDialogTheme
            .createTestSessionDialogSearchResultIconSize,
        color: iconColor,
      ),
    );
  }
}

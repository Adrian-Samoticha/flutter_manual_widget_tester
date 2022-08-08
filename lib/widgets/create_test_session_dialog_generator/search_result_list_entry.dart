
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'create_test_session_dialog.dart';

class SearchResultListEntry extends StatefulWidget {
  const SearchResultListEntry({
    Key? key,
    required this.index,
    required this.legalSelectedSearchResultIndex,
    required this.builder,
    required this.newTestSessionDialog,
  }) : super(key: key);

  final int index;
  final int legalSelectedSearchResultIndex;
  final WidgetTestBuilder builder;
  final CreateTestSessionDialog newTestSessionDialog;

  @override
  State<SearchResultListEntry> createState() => _SearchResultListEntryState();
}

class _SearchResultListEntryState extends State<SearchResultListEntry> {
  var _isBeingHovered = false;
  
  @override
  Widget build(BuildContext context) {
    final themeSettings = widget.newTestSessionDialog.themeSettings;
    
    return GestureDetector(
      onTapDown: (_) {
        final widgetTestSessionHandler = widget.newTestSessionDialog.widgetTestSessionHandler;
        widgetTestSessionHandler.createNewSession(widget.builder);
        Navigator.maybePop(context);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            _isBeingHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isBeingHovered = false;
          });
        },
        child: AnimatedOpacity(
          duration: themeSettings.createTestSessionDialogSearchResultFadeDuration,
          opacity: widget.index == widget.legalSelectedSearchResultIndex || _isBeingHovered ? 1.0 : themeSettings.createTestSessionDialogUnselectedSearchResultOpacity,
          child: Container(
            height: themeSettings.createTestSessionDialogSearchResultHeight,
            decoration: widget.index == widget.legalSelectedSearchResultIndex ? themeSettings.createTestSessionDialogSelectedSearchResultDecoration : themeSettings.createTestSessionDialogUnselectedSearchResultDecoration,
            child: _generateIconAndNameRow(),
          ),
        ),
      ),
    );
  }

  Row _generateIconAndNameRow() {
    final themeSettings = widget.newTestSessionDialog.themeSettings;
    
    return Row(
      children: [
        ...widget.builder.icon == null ? const [] : [
          _SearchResultIcon(
            themeSettings: themeSettings,
            icon: widget.builder.icon!,
            iconColor: widget.builder.iconColor ?? themeSettings.defaultIconColor,
          ),
        ],
        Expanded(
          child: Text(
            widget.builder.name,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: themeSettings.createTestSessionDialogSearchResultTextStyle,
          ),
        ),
      ],
    );
  }
}

class _SearchResultIcon extends StatelessWidget {
  const _SearchResultIcon({
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
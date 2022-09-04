import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'search_result_icon.dart';

class SearchResultListEntry extends StatefulWidget {
  const SearchResultListEntry({
    Key? key,
    required this.index,
    required this.legalSelectedSearchResultIndex,
    required this.builder,
    required this.themeSettings,
    required this.widgetTestSessionHandler,
  }) : super(key: key);

  final int index;
  final int legalSelectedSearchResultIndex;
  final WidgetTestBuilder builder;
  final ManualWidgetTesterThemeSettings themeSettings;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  State<SearchResultListEntry> createState() => _SearchResultListEntryState();
}

class _SearchResultListEntryState extends State<SearchResultListEntry> {
  var _isBeingHovered = false;
  
  @override
  Widget build(BuildContext context) {
    final themeSettings = widget.themeSettings;
    
    return GestureDetector(
      onTapDown: (_) {
        final widgetTestSessionHandler = widget.widgetTestSessionHandler;
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
            child: _buildIconAndNameRow(),
          ),
        ),
      ),
    );
  }

  Row _buildIconAndNameRow() {
    final themeSettings = widget.themeSettings;
    
    return Row(
      children: [
        ...widget.builder.icon == null ? const [] : [
          SearchResultIcon(
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
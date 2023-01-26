import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'search_result_icon.dart';

class SearchResultListEntry extends StatefulWidget {
  const SearchResultListEntry({
    Key? key,
    required this.index,
    required this.legalSelectedSearchResultIndex,
    required this.builder,
    required this.widgetTestSessionHandler,
  }) : super(key: key);

  final int index;
  final int legalSelectedSearchResultIndex;
  final WidgetTestBuilder builder;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  State<SearchResultListEntry> createState() => _SearchResultListEntryState();
}

class _SearchResultListEntryState extends State<SearchResultListEntry> {
  final GlobalKey _globalKey = GlobalKey();
  var _isBeingHovered = false;
  var _wasSelected = false;

  bool get _isSelected => widget.index == widget.legalSelectedSearchResultIndex;

  void _ensureVisible() {
    if (_globalKey.currentContext == null) {
      return;
    }

    Scrollable.ensureVisible(_globalKey.currentContext!,
        duration: ManualWidgetTesterTheme.of(context)
            .generalTheme
            .scrollIntoViewDuration,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart);

    Scrollable.ensureVisible(_globalKey.currentContext!,
        duration: ManualWidgetTesterTheme.of(context)
            .generalTheme
            .scrollIntoViewDuration,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd);
  }

  @override
  void initState() {
    super.initState();

    // During the first build `_globalKey.currentContext` is null, therefore,
    // use a timer to ensure that `_ensureVisible` is called after `build` has
    // completed.
    if (_isSelected) {
      Timer(const Duration(), _ensureVisible);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSelected && !_wasSelected) {
      _ensureVisible();
    }

    _wasSelected = _isSelected;

    return GestureDetector(
      key: _globalKey,
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
          duration: ManualWidgetTesterTheme.of(context)
              .createTestSessionDialogTheme
              .searchResultFadeDuration,
          opacity: _isSelected || _isBeingHovered
              ? 1.0
              : ManualWidgetTesterTheme.of(context)
                  .createTestSessionDialogTheme
                  .unselectedSearchResultOpacity,
          child: Container(
            height: ManualWidgetTesterTheme.of(context)
                .createTestSessionDialogTheme
                .searchResultHeight,
            decoration: _isSelected
                ? ManualWidgetTesterTheme.of(context)
                    .createTestSessionDialogTheme
                    .selectedSearchResultDecoration
                : ManualWidgetTesterTheme.of(context)
                    .createTestSessionDialogTheme
                    .unselectedSearchResultDecoration,
            child: _buildIconAndNameRow(),
          ),
        ),
      ),
    );
  }

  Row _buildIconAndNameRow() {
    final themeData = ManualWidgetTesterTheme.of(context);

    return Row(
      children: [
        ...widget.builder.icon == null
            ? const []
            : [
                SearchResultIcon(
                  icon: widget.builder.icon!,
                  iconColor: widget.builder.iconColor ??
                      themeData.iconTheme.defaultColor,
                ),
              ],
        Expanded(
          child: Text(
            widget.builder.name,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: themeData.createTestSessionDialogTheme.searchResultTextStyle,
          ),
        ),
      ],
    );
  }
}

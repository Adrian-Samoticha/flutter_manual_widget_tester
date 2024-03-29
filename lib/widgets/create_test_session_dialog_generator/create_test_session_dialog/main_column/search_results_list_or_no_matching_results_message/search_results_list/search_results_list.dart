import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';

import 'search_result_list_entry/search_result_list_entry.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.widgetTestSessionHandler,
    required this.legalSelectedSearchResultIndex,
    required this.searchResults,
    required this.maxHeight,
  });

  final WidgetTestSessionHandler widgetTestSessionHandler;
  final List<WidgetTestBuilder> searchResults;
  final int legalSelectedSearchResultIndex;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: DefaultTextStyleProvider.defaultTextStyle,
      child: Padding(
        padding: ManualWidgetTesterTheme.of(context)
            .createTestSessionDialogTheme
            .searchResultsPadding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: SingleChildScrollView(
            child: _SearchResultListColumn(
              widgetTestSessionHandler: widgetTestSessionHandler,
              searchResults: searchResults,
              legalSelectedSearchResultIndex: legalSelectedSearchResultIndex,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchResultListColumn extends StatelessWidget {
  const _SearchResultListColumn({
    required this.widgetTestSessionHandler,
    required this.searchResults,
    required this.legalSelectedSearchResultIndex,
  });

  final WidgetTestSessionHandler widgetTestSessionHandler;
  final List<WidgetTestBuilder> searchResults;
  final int legalSelectedSearchResultIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: searchResults
          .asMap()
          .entries
          .map((MapEntry<int, WidgetTestBuilder> entry) {
        final index = entry.key;
        final builder = entry.value;

        return SearchResultListEntry(
          index: index,
          legalSelectedSearchResultIndex: legalSelectedSearchResultIndex,
          builder: builder,
          widgetTestSessionHandler: widgetTestSessionHandler,
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';

import 'no_matching_results_message.dart';
import 'search_results_list/search_results_list.dart';

/// A widget that displays either the [NoMatchingResultsMessage] widget or the
/// [SearchResultsList] widget based on the value of [searchResults].
class SearchResultsListOrNoMatchingResultsMessage extends StatelessWidget {
  /// Creates either a [SearchResultsList] or a [NoMatchingResultsMessage].
  ///
  /// Which widget is selected depends on whether [searchResults] is empty.
  const SearchResultsListOrNoMatchingResultsMessage({
    super.key,
    required this.searchResults,
    required this.legalSelectedSearchResultIndex,
    required this.maxHeight,
    required this.widgetTestSessionHandler,
  });

  final List<WidgetTestBuilder> searchResults;
  final int legalSelectedSearchResultIndex;
  final double maxHeight;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  Widget build(BuildContext context) {
    if (searchResults.isEmpty) {
      return const NoMatchingResultsMessage();
    }

    return SearchResultsList(
      widgetTestSessionHandler: widgetTestSessionHandler,
      searchResults: searchResults,
      legalSelectedSearchResultIndex: legalSelectedSearchResultIndex,
      maxHeight: maxHeight,
    );
  }
}

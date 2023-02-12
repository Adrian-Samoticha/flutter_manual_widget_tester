import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/util/get_resemblance_to_search_term.dart';

import 'search_bar.dart';
import 'search_results_list_or_no_matching_results_message/search_results_list_or_no_matching_results_message.dart';

class MainColumn extends StatefulWidget {
  const MainColumn({
    super.key,
    required this.builders,
    required this.widgetTestSessionHandler,
  });

  final List<WidgetTestBuilder> builders;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  @override
  State<MainColumn> createState() => _MainColumnState();
}

class _MainColumnState extends State<MainColumn> {
  var _searchTerm = '';
  var _selectedSearchResultIndex = 0;
  late List<WidgetTestBuilder> _searchResults;

  int get _legalSelectedSearchResultIndex =>
      _selectedSearchResultIndex.clamp(0, _searchResults.length - 1);

  @override
  void initState() {
    _searchResults = _generateSearchResultsFromSearchTerm(_searchTerm);
    super.initState();
  }

  List<WidgetTestBuilder> _generateSearchResultsFromSearchTerm(
    String searchTerm,
  ) {
    if (searchTerm.isEmpty) {
      return widget.builders;
    }

    return [
      ...widget.builders.where((element) =>
          element.name.getResemblanceToSearchTerm(searchTerm) > 0.0),
    ]..sort((e1, e2) {
        final e1Resemblance = e1.name.getResemblanceToSearchTerm(searchTerm);
        final e2Resemblance = e2.name.getResemblanceToSearchTerm(searchTerm);

        return -e1Resemblance.compareTo(e2Resemblance);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: false,
      onKeyEvent: (FocusNode node, KeyEvent event) {
        if (event.physicalKey == PhysicalKeyboardKey.arrowDown &&
            (event is KeyDownEvent || event is KeyRepeatEvent)) {
          setState(() {
            _selectedSearchResultIndex = _legalSelectedSearchResultIndex + 1;
          });

          return KeyEventResult.handled;
        }

        if (event.physicalKey == PhysicalKeyboardKey.arrowUp &&
            (event is KeyDownEvent || event is KeyRepeatEvent)) {
          setState(() {
            _selectedSearchResultIndex = _legalSelectedSearchResultIndex - 1;
          });

          return KeyEventResult.handled;
        }

        if (event.physicalKey == PhysicalKeyboardKey.enter &&
            event is KeyDownEvent) {
          final selectedSearchResult =
              _searchResults[_legalSelectedSearchResultIndex];
          widget.widgetTestSessionHandler
              .createNewSession(selectedSearchResult);
          Navigator.maybePop(context);

          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBar(
            onSearchTermChanged: (newSearchTerm) {
              setState(() {
                _selectedSearchResultIndex = 0;
                _searchTerm = newSearchTerm;
                _searchResults =
                    _generateSearchResultsFromSearchTerm(_searchTerm);
              });
            },
          ),
          SearchResultsListOrNoMatchingResultsMessage(
            widgetTestSessionHandler: widget.widgetTestSessionHandler,
            legalSelectedSearchResultIndex: _legalSelectedSearchResultIndex,
            searchResults: _searchResults,
            maxHeight: MediaQuery.of(context).size.height *
                ManualWidgetTesterTheme.of(context)
                    .createTestSessionDialogTheme
                    .searchResultsHeightFactor,
          ),
        ],
      ),
    );
  }
}

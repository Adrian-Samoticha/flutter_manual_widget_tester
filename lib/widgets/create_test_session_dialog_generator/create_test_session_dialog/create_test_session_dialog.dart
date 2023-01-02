import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/get_resemblance_to_search_term.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import 'no_matching_results_message.dart';
import 'search_results_list/search_results_list.dart';

class CreateTestSessionDialog extends StatefulWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final List<WidgetTestBuilder> builders;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  const CreateTestSessionDialog(
      {Key? key,
      required this.themeSettings,
      required this.builders,
      required this.widgetTestSessionHandler})
      : super(key: key);

  @override
  State<CreateTestSessionDialog> createState() =>
      _CreateTestSessionDialogState();
}

class _CreateTestSessionDialogState extends State<CreateTestSessionDialog> {
  var _searchTerm = '';
  final _textEditingController = TextEditingController();
  var _selectedSearchResultIndex = 0;
  late List<WidgetTestBuilder> _searchResults;

  int get _legalSelectedSearchResultIndex =>
      _selectedSearchResultIndex.clamp(0, _searchResults.length - 1);

  @override
  void initState() {
    _searchResults = _generateSearchResultsFromSearchTerm(_searchTerm);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: widget.themeSettings.isDark ? ThemeData.dark() : ThemeData.light(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom:
                widget.themeSettings.dialogTheme.dialogBorderRadius.bottomLeft,
          ),
          color: widget.themeSettings.dialogTheme.dialogBackgroundColor,
          border: Border.fromBorderSide(
            BorderSide(
                color: widget.themeSettings.dialogTheme.dialogBorderColor),
          ),
          boxShadow: widget.themeSettings.dialogTheme.dialogShadow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom:
                widget.themeSettings.dialogTheme.dialogBorderRadius.bottomLeft,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: widget.themeSettings.dialogTheme.dialogBlurRadius,
                sigmaY: widget.themeSettings.dialogTheme.dialogBlurRadius),
            child: Container(
              width: widget.themeSettings.createTestSessionDialogTheme
                  .createTestSessionDialogWidth,
              padding: widget.themeSettings.createTestSessionDialogTheme
                  .createTestSessionDialogPadding,
              child: _buildMainColumn(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainColumn() {
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
          _buildSearchBar(),
          _buildSearchResultList(MediaQuery.of(context).size.height *
              widget.themeSettings.createTestSessionDialogTheme
                  .createTestSessionDialogSearchResultsHeightFactor),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      height: widget.themeSettings.createTestSessionDialogTheme
          .createTestSessionDialogSearchBarHeight,
      child: ManualWidgetTesterTextField(
        textEditingController: _textEditingController,
        onSubmitted: (_) {},
        onChanged: (newSearchTerm) {
          setState(() {
            _selectedSearchResultIndex = 0;
            _searchTerm = newSearchTerm;
            _searchResults = _generateSearchResultsFromSearchTerm(_searchTerm);
          });
        },
        themeSettings: widget.themeSettings,
        autofocus: true,
      ),
    );
  }

  Widget _buildSearchResultList(double maxHeight) {
    if (_searchResults.isEmpty) {
      return NoMatchingResultsMessage(
        themeSettings: widget.themeSettings,
      );
    }

    return SearchResultsList(
      themeSettings: widget.themeSettings,
      widgetTestSessionHandler: widget.widgetTestSessionHandler,
      searchResults: _searchResults,
      legalSelectedSearchResultIndex: _legalSelectedSearchResultIndex,
      maxHeight: maxHeight,
    );
  }

  List<WidgetTestBuilder> _generateSearchResultsFromSearchTerm(
      String searchTerm) {
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
}

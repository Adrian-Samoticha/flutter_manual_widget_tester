import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/get_resemblance_to_search_term.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

import 'search_result_list_entry.dart';

class CreateTestSessionDialog extends StatefulWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final List<WidgetTestBuilder> builders;
  final WidgetTestSessionHandler widgetTestSessionHandler;

  const CreateTestSessionDialog({Key? key, required this.themeSettings, required this.builders, required this.widgetTestSessionHandler}) : super(key: key);

  @override
  State<CreateTestSessionDialog> createState() => _CreateTestSessionDialogState();
}

class _CreateTestSessionDialogState extends State<CreateTestSessionDialog> {
  var _searchTerm = '';
  final _textEditingController = TextEditingController();
  var _selectedSearchResultIndex = 0;
  late List<WidgetTestBuilder> _searchResults;
  
  get _legalSelectedSearchResultIndex => _selectedSearchResultIndex.clamp(0, _searchResults.length - 1);
  
  @override
  void initState() {
    _searchResults = _generateSearchResultsFromSearchTerm(_searchTerm);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: widget.themeSettings.dialogBorderRadius.bottomLeft,
        ),
        color: widget.themeSettings.dialogBackgroundColor,
        border: Border.fromBorderSide(
          BorderSide(color: widget.themeSettings.dialogBorderColor),
        ),
        boxShadow: widget.themeSettings.dialogShadow.map((BoxShadow boxShadow) {
          return BoxShadow(
            blurRadius: boxShadow.blurRadius,
            color: boxShadow.color,
            blurStyle: boxShadow.blurStyle,
            offset: boxShadow.offset,
            spreadRadius: boxShadow.spreadRadius,
          );
        }).toList(),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: widget.themeSettings.dialogBorderRadius.bottomLeft,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: widget.themeSettings.dialogBlurRadius, sigmaY: widget.themeSettings.dialogBlurRadius),
          child: Container(
            width: widget.themeSettings.createTestSessionDialogWidth,
            padding: widget.themeSettings.createTestSessionDialogPadding,
            child: _generateMainColumn(),
          ),
        ),
      ),
    );
  }

  Widget _generateMainColumn() {
    return Focus(
      autofocus: false,
      onKeyEvent: (FocusNode node, KeyEvent event) {
        if (event.physicalKey == PhysicalKeyboardKey.arrowDown && event is KeyDownEvent) {
          setState(() {
            _selectedSearchResultIndex = _legalSelectedSearchResultIndex + 1;
          });
          return KeyEventResult.handled;
        }
        
        if (event.physicalKey == PhysicalKeyboardKey.arrowUp && event is KeyDownEvent) {
          setState(() {
            _selectedSearchResultIndex = _legalSelectedSearchResultIndex - 1;
          });
          return KeyEventResult.handled;
        }
        
        if (event.physicalKey == PhysicalKeyboardKey.enter && event is KeyDownEvent) {
          final selectedSearchResult = _searchResults[_legalSelectedSearchResultIndex];
          widget.widgetTestSessionHandler.createNewSession(selectedSearchResult);
          Navigator.maybePop(context);
          return KeyEventResult.handled;
        }
        
        return KeyEventResult.ignored;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _generateSearchBar(),
          _generateSearchResultList(MediaQuery.of(context).size.height * widget.themeSettings.createTestSessionDialogSearchResultsHeightFactor),
        ],
      ),
    );
  }

  Widget _generateSearchBar() {
    return SizedBox(
      height: widget.themeSettings.createTestSessionDialogSearchBarHeight,
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

  Widget _generateSearchResultList(double maxHeight) {
    if (_searchResults.isEmpty) {
      return Padding(
        padding: widget.themeSettings.createTestSessionDialogSearchResultsPadding,
        child: DefaultTextStyle(
          style: DefaultTextStyleProvider.defaultTextStyle,
          child: Text(
            'No matching results.',
            style: widget.themeSettings.createTestSessionDialogNoMatchingResultsTextStyle
          ),
        ),
      );
    }
    
    return DefaultTextStyle(
      style: DefaultTextStyleProvider.defaultTextStyle,
      child: Container(
        padding: widget.themeSettings.createTestSessionDialogSearchResultsPadding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _searchResults.asMap().entries.map((MapEntry<int, WidgetTestBuilder> entry) {
                final index = entry.key;
                final builder = entry.value;
                
                return SearchResultListEntry(
                  index: index,
                  legalSelectedSearchResultIndex: _legalSelectedSearchResultIndex,
                  builder: builder,
                  themeSettings: widget.themeSettings,
                  widgetTestSessionHandler: widget.widgetTestSessionHandler,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
  
  List<WidgetTestBuilder> _generateSearchResultsFromSearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) {
      return widget.builders;
    }
    
    return [
      ...widget.builders.where((element) => element.name.getResemblanceToSearchTerm(searchTerm) > 0.0),
    ]..sort((e1, e2) {
      final e1Resemblance = e1.name.getResemblanceToSearchTerm(searchTerm);
      final e2Resemblance = e2.name.getResemblanceToSearchTerm(searchTerm);
      
      return -e1Resemblance.compareTo(e2Resemblance);
    });
  }
}
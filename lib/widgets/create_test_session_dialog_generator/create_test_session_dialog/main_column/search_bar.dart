import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, required this.onSearchTermChanged});

  final void Function(String) onSearchTermChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ManualWidgetTesterTheme.of(context)
          .createTestSessionDialogTheme
          .searchBarHeight,
      child: ManualWidgetTesterTextField(
        textEditingController: _textEditingController,
        onSubmitted: (_) {},
        onChanged: widget.onSearchTermChanged,
        autofocus: true,
      ),
    );
  }
}

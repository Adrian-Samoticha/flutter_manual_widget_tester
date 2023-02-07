library flutter_manual_widget_tester;

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/editor_builder_installer.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_data.dart';
import 'package:flutter_manual_widget_tester/const/default_text_style_provider.dart';
import 'package:flutter_manual_widget_tester/util/list_has_duplicates.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/app_bar/app_bar.dart';
import 'package:flutter_manual_widget_tester/widgets/background.dart';
import 'package:flutter_manual_widget_tester/widgets/sidebar/sidebar.dart';
import 'package:flutter_manual_widget_tester/widgets/widget_test_session_area_stack/widget_test_session_area_stack.dart';

export 'package:flutter_manual_widget_tester/config/theme_config/theme_data.dart';
export 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';

class ManualWidgetTester extends StatefulWidget {
  const ManualWidgetTester({
    super.key,
    this.themeData = const ManualWidgetTesterThemeData(),
    this.doubleEditorInfiniteScrollViewRange = 3.0,
    this.doubleEditorInfiniteScrollViewScrollSpeedFactor = 0.003,
    required this.builders,
  });

  final ManualWidgetTesterThemeData themeData;
  final double doubleEditorInfiniteScrollViewRange;
  final double doubleEditorInfiniteScrollViewScrollSpeedFactor;
  final List<WidgetTestBuilder> builders;

  @override
  State<ManualWidgetTester> createState() => _ManualWidgetTesterState();
}

class _ManualWidgetTesterState extends State<ManualWidgetTester> {
  final _widgetTestSessionHandler = WidgetTestSessionHandler();
  final TypeEditorBuilder _typeEditorBuilder = TypeEditorBuilder();

  ConfigData get _configData => ConfigData(
        doubleEditorInfiniteScrollViewRange:
            widget.doubleEditorInfiniteScrollViewRange,
        doubleEditorInfiniteScrollViewScrollSpeedFactor:
            widget.doubleEditorInfiniteScrollViewScrollSpeedFactor,
      );

  @override
  void initState() {
    _installDefaultEditorBuilders();

    super.initState();
  }

  void _installDefaultEditorBuilders() {
    EditorBuilderInstaller.installDefaultEditorBuilders(
      typeEditorBuilder: _typeEditorBuilder,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(
        !widget.builders
            .hasDuplicates((WidgetTestBuilder builder) => builder.id),
        'Found duplicate keys in `builders` list. All widget test builders '
        'must have unique keys.');

    // Updating all test sessions is necessary in case the source code of one of
    // the widget test builders has been changed by the user of the library.
    for (final WidgetTestBuilder builder in widget.builders) {
      _widgetTestSessionHandler.updateSessions(builder);
    }

    return Theme(
      data: widget.themeData.generalTheme.isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      child: DefaultTextStyle(
        style: DefaultTextStyleProvider.defaultTextStyle,
        child: ManualWidgetTesterTheme(
          themeData: widget.themeData,
          child: Config(
            data: _configData,
            child: MouseCursorOverrider(
              child: Stack(
                children: [
                  ManualWidgetTesterBackground(
                    color: widget.themeData.generalTheme.backgroundColor,
                  ),
                  _ManualWidgetTesterBody(
                    widgetTestSessionHandler: _widgetTestSessionHandler,
                    typeEditorBuilder: _typeEditorBuilder,
                    builders: widget.builders,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ManualWidgetTesterBody extends StatelessWidget {
  const _ManualWidgetTesterBody({
    required this.widgetTestSessionHandler,
    required this.typeEditorBuilder,
    required this.builders,
  });

  final WidgetTestSessionHandler widgetTestSessionHandler;
  final TypeEditorBuilder typeEditorBuilder;
  final List<WidgetTestBuilder> builders;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ManualWidgetTesterSidebar(
              maxWidth: constraints.maxWidth - 128.0,
              widgetTestSessionHandler: widgetTestSessionHandler,
              typeEditorBuilder: typeEditorBuilder,
            ),
            Expanded(
              child: Column(
                children: [
                  ManualWidgetTesterAppBar(
                    widgetTestSessionHandler: widgetTestSessionHandler,
                    builders: builders,
                  ),
                  Expanded(
                    child: ManualWidgetTesterWidgetTestSessionAreaStack(
                      widgetTestSessionHandler: widgetTestSessionHandler,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

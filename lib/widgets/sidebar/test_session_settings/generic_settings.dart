import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_generic_settings.dart';
import 'package:flutter_manual_widget_tester/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/generic_settings_editors/editors/edge_inset_editor.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class GenericSettings extends StatefulWidget {
  const GenericSettings({
    Key? key,
    required this.themeSettings,
    required this.config,
    required this.session,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final ManualWidgetTesterConfig config;
  final WidgetTestSession session;

  @override
  State<GenericSettings> createState() => _GenericSettingsState();
}

class _GenericSettingsState extends State<GenericSettings> {
  late StreamSubscription<WidgetTestSessionGenericSettings>
      _onGenericSettingsChangedStreamSubscription;

  @override
  void initState() {
    final genericSettings = widget.session.genericSettings;

    _onGenericSettingsChangedStreamSubscription =
        genericSettings.registerOnChangedCallback((_) => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    _onGenericSettingsChangedStreamSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ManualWidgetTesterFoldableRegion(
      isIndented: true,
      heading: 'GENERIC SETTINGS',
      themeSettings: widget.themeSettings,
      child: Column(
        children: _generateGenericSettingsChildren(),
      ),
    );
  }

  List<Widget> _generateGenericSettingsChildren() {
    final genericSettings = widget.session.genericSettings;
    final mediaQueryData = genericSettings.mediaQueryData;

    return [
      ManualWidgetTesterFoldableRegion(
        heading: 'PADDING',
        themeSettings: widget.themeSettings,
        isIndented: true,
        isInitiallyFolded: true,
        child: ManualWidgetTesterGenericSettingsEdgeInsetEditor(
          themeSettings: widget.themeSettings,
          settingName: 'padding',
          currentEdgeInsets: mediaQueryData.padding,
          onChanged: (EdgeInsets newPadding) {
            final newMediaQueryData =
                mediaQueryData.copyWith(padding: newPadding);
            genericSettings.mediaQueryData = newMediaQueryData;
          },
          infiniteScrollViewRange:
              widget.config.doubleEditorInfiniteScrollViewRange,
          infiniteScrollViewScrollSpeedFactor:
              widget.config.doubleEditorInfiniteScrollViewScrollSpeedFactor,
          onlyAllowPositiveValues: true,
        ),
      ),
    ];
  }
}

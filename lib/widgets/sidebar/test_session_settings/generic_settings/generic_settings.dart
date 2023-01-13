import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_generic_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

import 'default_text_style_settings.dart';
import 'media_query_settings.dart';

class GenericSettings extends StatefulWidget {
  /// Creates a widget that displays generic settings for a widget test session.
  ///
  /// The [key] is used to identify this widget in the widget tree.
  /// The [themeSettings] is the theme settings for the widget.
  /// The [session] is the widget test session for which the generic settings
  /// are displayed.
  const GenericSettings({
    Key? key,
    required this.session,
  }) : super(key: key);

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
      child: Column(
        children: _generateGenericSettingsChildren(),
      ),
    );
  }

  List<Widget> _generateGenericSettingsChildren() {
    return [
      MediaQuerySettings(
        session: widget.session,
      ),
      DefaultTextStyleSettings(
        session: widget.session,
      ),
    ];
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

import 'tab_box/tab_box.dart';

class ManualWidgetTesterTab extends StatefulWidget {
  const ManualWidgetTesterTab(
      {Key? key,
      required this.width,
      required this.widgetName,
      required this.tabIndex,
      required this.focusedTabIndex,
      required this.onSelect,
      required this.onClose,
      required this.icon,
      required this.iconColor})
      : super(key: key);

  final double width;
  final int tabIndex;
  final int focusedTabIndex;
  final String widgetName;
  final void Function() onSelect;
  final void Function() onClose;
  final IconData? icon;
  final Color iconColor;

  @override
  State<ManualWidgetTesterTab> createState() => _ManualWidgetTesterTabState();
}

class _ManualWidgetTesterTabState extends State<ManualWidgetTesterTab> {
  final GlobalKey _globalKey = GlobalKey();
  bool _isBeingHovered = false;
  bool _wasFocused = false;

  bool get _isFocused => widget.tabIndex == widget.focusedTabIndex;

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
    if (_isFocused) {
      Timer(const Duration(), _ensureVisible);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFocused && !_wasFocused) {
      _ensureVisible();
    }

    _wasFocused = _isFocused;

    return GestureDetector(
      key: _globalKey,
      onTapDown: (_) => widget.onSelect(),
      onTertiaryTapDown: (_) => widget.onClose(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() {
          _isBeingHovered = true;
        }),
        onExit: (_) => setState(() {
          _isBeingHovered = false;
        }),
        child: TabBox(
          isBeingHovered: _isBeingHovered,
          icon: widget.icon,
          iconColor: widget.iconColor,
          isFocused: _isFocused,
          focusedTabIndex: widget.focusedTabIndex,
          tabIndex: widget.tabIndex,
          widgetName: widget.widgetName,
          width: widget.width,
        ),
      ),
    );
  }
}

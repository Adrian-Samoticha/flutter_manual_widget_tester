import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'close_tab_button.dart';

class ManualWidgetTesterTestSessionMenuItem extends StatefulWidget {
  final int tabIndex;
  final int focusedTabIndex;
  final String widgetName;
  final void Function() onSelect;
  final void Function() onClose;
  final bool enableIcon;
  final IconData? icon;
  final Color iconColor;

  const ManualWidgetTesterTestSessionMenuItem(
      {Key? key,
      required this.tabIndex,
      required this.focusedTabIndex,
      required this.widgetName,
      required this.onSelect,
      required this.onClose,
      this.icon,
      required this.iconColor,
      required this.enableIcon})
      : super(key: key);

  @override
  State<ManualWidgetTesterTestSessionMenuItem> createState() =>
      _ManualWidgetTesterTestSessionMenuItemState();
}

class _ManualWidgetTesterTestSessionMenuItemState
    extends State<ManualWidgetTesterTestSessionMenuItem> {
  bool _isBeingHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        _isBeingHovered = true;
      }),
      onExit: (_) => setState(() {
        _isBeingHovered = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => widget.onSelect(),
        onTertiaryTapDown: (_) => widget.onClose(),
        child: Opacity(
          opacity: widget.tabIndex == widget.focusedTabIndex
              ? 1.0
              : ManualWidgetTesterTheme.of(context)
                  .testSessionMenuItemTheme
                  .testSessionMenuItemUnfocusedTabOpacity,
          child: Container(
            height: ManualWidgetTesterTheme.of(context)
                .testSessionMenuItemTheme
                .testSessionMenuItemHeight,
            decoration: widget.tabIndex != widget.focusedTabIndex
                ? null
                : ManualWidgetTesterTheme.of(context)
                    .testSessionMenuItemTheme
                    .testSessionMenuItemFocusedTabTintDecoration,
            child: Stack(
              children: [
                _buildHoverTint(),
                Padding(
                  padding: ManualWidgetTesterTheme.of(context)
                      .testSessionMenuItemTheme
                      .testSessionMenuItemPadding,
                  child: _buildTabRow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTabRow() {
    return Row(
      children: [
        ...widget.enableIcon
            ? [
                _buildTabIcon(),
              ]
            : const [],
        Expanded(
          child: _buildTabText(),
        ),
        _buildCloseTabButton(),
      ],
    );
  }

  Widget _buildCloseTabButton() {
    final isVisible =
        _isBeingHovered || widget.tabIndex == widget.focusedTabIndex;
    final tweenValue = isVisible ? 1.0 : 0.0;

    return CloseTabButton(
      tweenValue: tweenValue,
      onPressed: widget.onClose,
    );
  }

  Text _buildTabText() {
    return Text(widget.widgetName,
        softWrap: false,
        overflow: ManualWidgetTesterTheme.of(context)
            .testSessionMenuItemTheme
            .testSessionMenuItemTextOverflow,
        style: ManualWidgetTesterTheme.of(context)
            .testSessionMenuItemTheme
            .testSessionMenuItemTextStyle);
  }

  Padding _buildTabIcon() {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context)
          .testSessionMenuItemTheme
          .testSessionMenuItemTabIconPadding,
      child: Icon(
        widget.icon,
        color: widget.iconColor,
        size: ManualWidgetTesterTheme.of(context)
            .testSessionMenuItemTheme
            .testSessionMenuItemIconSize,
      ),
    );
  }

  AnimatedOpacity _buildHoverTint() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 50),
      opacity: _isBeingHovered ? 1.0 : 0.0,
      child: Container(
          decoration: ManualWidgetTesterTheme.of(context)
              .testSessionMenuItemTheme
              .testSessionMenuItemHoverTintDecoration),
    );
  }
}

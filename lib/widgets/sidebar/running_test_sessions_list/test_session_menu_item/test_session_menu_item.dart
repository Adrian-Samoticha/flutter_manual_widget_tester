import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'close_tab_button.dart';

class ManualWidgetTesterTestSessionMenuItem extends StatefulWidget {
  const ManualWidgetTesterTestSessionMenuItem({
    super.key,
    required this.tabIndex,
    required this.focusedTabIndex,
    required this.widgetName,
    required this.onSelect,
    required this.onClose,
    this.icon,
    required this.iconColor,
    required this.enableIcon,
  });

  final int tabIndex;
  final int focusedTabIndex;
  final String widgetName;
  final void Function() onSelect;
  final void Function() onClose;
  final bool enableIcon;
  final IconData? icon;
  final Color iconColor;

  @override
  State<ManualWidgetTesterTestSessionMenuItem> createState() =>
      _ManualWidgetTesterTestSessionMenuItemState();
}

class _ManualWidgetTesterTestSessionMenuItemState
    extends State<ManualWidgetTesterTestSessionMenuItem> {
  bool _isBeingHovered = false;

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
    return Text(
      widget.widgetName,
      softWrap: false,
      overflow: ManualWidgetTesterTheme.of(context)
          .testSessionMenuItemTheme
          .textOverflow,
      style: ManualWidgetTesterTheme.of(context)
          .testSessionMenuItemTheme
          .textStyle,
    );
  }

  Padding _buildTabIcon() {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context)
          .testSessionMenuItemTheme
          .tabIconPadding,
      child: Icon(
        widget.icon,
        color: widget.iconColor,
        size: ManualWidgetTesterTheme.of(context)
            .testSessionMenuItemTheme
            .iconSize,
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
            .hoverTintDecoration,
      ),
    );
  }

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
                  .unfocusedTabOpacity,
          child: Container(
            height: ManualWidgetTesterTheme.of(context)
                .testSessionMenuItemTheme
                .height,
            decoration: widget.tabIndex != widget.focusedTabIndex
                ? null
                : ManualWidgetTesterTheme.of(context)
                    .testSessionMenuItemTheme
                    .focusedTabTintDecoration,
            child: Stack(
              children: [
                _buildHoverTint(),
                Padding(
                  padding: ManualWidgetTesterTheme.of(context)
                      .testSessionMenuItemTheme
                      .padding,
                  child: _buildTabRow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

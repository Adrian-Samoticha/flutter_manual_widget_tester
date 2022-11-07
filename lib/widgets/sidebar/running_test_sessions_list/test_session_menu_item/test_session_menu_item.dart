import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'close_tab_button.dart';

class ManualWidgetTesterTestSessionMenuItem extends StatefulWidget {
  final int tabIndex;
  final int selectedTabIndex;
  final String widgetName;
  final ManualWidgetTesterThemeSettings themeSettings;
  final void Function() onSelect;
  final void Function() onClose;
  final bool enableIcon;
  final IconData? icon;
  final Color iconColor;
  
  const ManualWidgetTesterTestSessionMenuItem({Key? key, required this.tabIndex, required this.selectedTabIndex, required this.widgetName, required this.themeSettings, required this.onSelect, required this.onClose, this.icon, required this.iconColor, required this.enableIcon}) : super(key: key);

  @override
  State<ManualWidgetTesterTestSessionMenuItem> createState() => _ManualWidgetTesterTestSessionMenuItemState();
}

class _ManualWidgetTesterTestSessionMenuItemState extends State<ManualWidgetTesterTestSessionMenuItem> {
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
          opacity: widget.tabIndex == widget.selectedTabIndex ? 1.0 : widget.themeSettings.testSessionMenuItemUnselectedTabOpacity,
          child: Container(
            height: widget.themeSettings.testSessionMenuItemHeight,
            decoration: widget.tabIndex != widget.selectedTabIndex ? null : widget.themeSettings.testSessionMenuItemSelectedTabTintDecoration,
            child: Stack(
              children: [
                _buildHoverTint(),
                Padding(
                  padding: widget.themeSettings.testSessionMenuItemPadding,
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
        ...widget.enableIcon ? [
          _buildTabIcon(),
        ] : const [],
        Expanded(
          child: _buildTabText(),
        ),
        _buildCloseTabButton(),
      ],
    );
  }

  Widget _buildCloseTabButton() {
    final isVisible = _isBeingHovered || widget.tabIndex == widget.selectedTabIndex;
    final tweenValue = isVisible ? 1.0 : 0.0;
    
    return CloseTabButton(
      themeSettings: widget.themeSettings,
      tweenValue: tweenValue,
      onPressed: widget.onClose,
    );
  }

  Text _buildTabText() {
    return Text(
      widget.widgetName,
      softWrap: false,
      overflow: widget.themeSettings.testSessionMenuItemTextOverflow,
      style: widget.themeSettings.testSessionMenuItemTextStyle
    );
  }

  Padding _buildTabIcon() {
    return Padding(
      padding: widget.themeSettings.testSessionMenuItemTabIconPadding,
      child: Icon(
        widget.icon,
        color: widget.iconColor,
        size: widget.themeSettings.testSessionMenuItemIconSize,
      ),
    );
  }

  AnimatedOpacity _buildHoverTint() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 50),
      opacity: _isBeingHovered ? 1.0 : 0.0,
      child: Container(
        decoration: widget.themeSettings.testSessionMenuItemHoverTintDecoration
      ),
    );
  }
}
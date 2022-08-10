import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/close_button.dart';

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
                _generateHoverTint(),
                Padding(
                  padding: widget.themeSettings.testSessionMenuItemPadding,
                  child: _generateTabRow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _generateTabRow() {
    return Row(
      children: [
        ...widget.enableIcon ? [
          _generateTabIcon(),
        ] : const [],
        Expanded(
          child: _generateTabText(),
        ),
        _generateTabCloseButton(),
      ],
    );
  }

  Widget _generateTabCloseButton() {
    final isVisible = _isBeingHovered || widget.tabIndex == widget.selectedTabIndex;
    final tweenValue = isVisible ? 1.0 : 0.0;
    
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: tweenValue, end: tweenValue),
      curve: Curves.decelerate,
      builder: (BuildContext context, double value, Widget? child) {
        return Align(
          widthFactor: value,
          child: Opacity(
            opacity: value,
            child: Padding(
              padding: widget.themeSettings.testSessionMenuItemCloseButtonPadding,
              child: child,
            ),
          ),
        );
      },
      child: SizedBox(
        width: widget.themeSettings.testSessionMenuItemCloseButtonSize,
        height: widget.themeSettings.testSessionMenuItemCloseButtonSize,
        child: ManualWidgetTesterCloseButton(
          themeSettings: widget.themeSettings,
          onPressed: widget.onClose,
          size: widget.themeSettings.testSessionMenuItemCloseButtonSize,
        ),
      ),
    );
  }

  Text _generateTabText() {
    return Text(
      widget.widgetName,
      softWrap: false,
      overflow: widget.themeSettings.testSessionMenuItemTextOverflow,
      style: widget.themeSettings.testSessionMenuItemTextStyle
    );
  }

  Padding _generateTabIcon() {
    return Padding(
      padding: widget.themeSettings.testSessionMenuItemTabIconPadding,
      child: Icon(
        widget.icon,
        color: widget.iconColor,
        size: widget.themeSettings.testSessionMenuItemIconSize,
      ),
    );
  }

  AnimatedOpacity _generateHoverTint() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 50),
      opacity: _isBeingHovered ? 1.0 : 0.0,
      child: Container(
        decoration: widget.themeSettings.testSessionMenuItemHoverTintDecoration
      ),
    );
  }
}
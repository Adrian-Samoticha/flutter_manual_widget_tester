import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'tab_background/tab_background.dart';
import 'tab_content/tab_content.dart';

class ManualWidgetTesterTab extends StatefulWidget {
  const ManualWidgetTesterTab({Key? key, required this.width, required this.widgetName, required this.themeSettings, required this.tabIndex, required this.selectedTabIndex, required this.onSelect, required this.onClose, required this.icon, required this.iconColor}) : super(key: key);
  
  final double width;
  final int tabIndex;
  final int selectedTabIndex;
  final String widgetName;
  final ManualWidgetTesterThemeSettings themeSettings;
  final void Function() onSelect;
  final void Function() onClose;
  final IconData? icon;
  final Color iconColor;

  @override
  State<ManualWidgetTesterTab> createState() => _ManualWidgetTesterTabState();
}

class _ManualWidgetTesterTabState extends State<ManualWidgetTesterTab> {
  bool _isBeingHovered = false;
  
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.tabIndex == widget.selectedTabIndex;
    
    return GestureDetector(
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
        child: _generateTabBox(isSelected),
      ),
    );
  }

  Widget _generateTabBox(bool isSelected) {
    return TweenAnimationBuilder<double>(
      duration: widget.themeSettings.tabOpenAnimationDuration,
      tween: Tween<double>(begin: 1.0, end: 0.0),
      curve: widget.themeSettings.tabOpenAnimationCurve,
      builder: (BuildContext context, double value, Widget? child) {
        return ClipRect(
          child: FractionalTranslation(
            translation: Offset(0.0, value),
            child: child!,
          ),
        );
      },
      child: SizedBox(
        width: widget.width,
        height: widget.themeSettings.appBarHeight,
        child: Padding(
          padding: EdgeInsets.only(top: widget.themeSettings.spaceAboveTabs),
          child: _generateTabStack(isSelected),
        ),
      ),
    );
  }

  Stack _generateTabStack(bool isSelected) {
    return Stack(
      children: [
        TabBackground(
          themeSettings: widget.themeSettings,
          tabIndex: widget.tabIndex,
          selectedTabIndex: widget.selectedTabIndex,
        ),
        TabContent(
          themeSettings: widget.themeSettings,
          isBeingHovered: _isBeingHovered,
          icon: widget.icon,
          iconColor: widget.iconColor,
          isSelected: isSelected,
          widgetName: widget.widgetName,
        ),
      ],
    );
  }
}

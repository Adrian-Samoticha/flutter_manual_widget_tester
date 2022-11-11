import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'tab_box/tab_box.dart';

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
        child: TabBox(
          isBeingHovered: _isBeingHovered,
          themeSettings: widget.themeSettings,
          icon: widget.icon,
          iconColor: widget.iconColor,
          isSelected: isSelected,
          selectedTabIndex: widget.selectedTabIndex,
          tabIndex: widget.tabIndex,
          widgetName: widget.widgetName,
          width: widget.width,
        ),
      ),
    );
  }
}

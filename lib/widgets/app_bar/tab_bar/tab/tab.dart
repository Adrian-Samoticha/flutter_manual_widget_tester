import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'tab_background.dart';
import 'tab_icon.dart';
import 'tab_text.dart';

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
        child: SizedBox(
          width: widget.width,
          height: widget.themeSettings.appBarHeight,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0), // TODO: add to theme settings
            child: Stack(
              children: [
                TabBackground(
                  themeSettings: widget.themeSettings,
                  tabIndex: widget.tabIndex,
                  selectedTabIndex: widget.selectedTabIndex,
                ),
                _generateTabRow(isSelected),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _generateTabRow(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // TODO: add to theme settings
      child: Row(
        children: [
          ...widget.icon == null ? []: [
            TabIcon(
              themeSettings: widget.themeSettings,
              icon: widget.icon!,
              iconColor: widget.iconColor,
              isSelected: isSelected,
              isBeingHovered: _isBeingHovered,
            ),
          ],
          Expanded(
            child: TabText(
              themeSettings: widget.themeSettings,
              widgetName: widget.widgetName,
              isSelected: isSelected,
              isBeingHovered: _isBeingHovered,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

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
        onEnter: (event) => setState(() {
          _isBeingHovered = true;
        }),
        onExit: (event) => setState(() {
          _isBeingHovered = false;
        }),
        child: SizedBox(
          width: widget.width,
          height: widget.themeSettings.appbarHeight,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Stack(
              children: [
                _TabBackground(
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ...widget.icon == null ? []: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(
                widget.icon,
                size: 21.0,
                color: widget.iconColor,
              ),
            ),
          ],
          Expanded(
            child: _TabText(
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

class _TabText extends StatelessWidget {
  const _TabText({
    Key? key,
    required this.widgetName,
    required this.isSelected,
    required this.isBeingHovered,
  }) : super(key: key);

  final String widgetName;
  final bool isSelected;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Center(
        child: Text(
          widgetName,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        )
      );
    }
    
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: isBeingHovered ? 0.7 : 0.4,
        child: Text(
          widgetName,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: const TextStyle(
            color:Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      )
    );
  }
}

class _TabBackground extends StatelessWidget {
  const _TabBackground({
    Key? key,
    required this.themeSettings,
    required this.tabIndex,
    required this.selectedTabIndex,
  }) : super(key: key);

  final int tabIndex;
  final int selectedTabIndex;
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    final isSelected = tabIndex == selectedTabIndex;
    
    return Stack(
      children: [
        Container(
          decoration: isSelected ? BoxDecoration(
            color: themeSettings.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3.0),
              topRight: Radius.circular(3.0),
            ),
          ) : const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
        !isSelected ? const SizedBox() : Container(
          width: 3.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3.0),
              bottomRight: Radius.circular(3.0),
            ),
            color: themeSettings.accentColor,
          ),
        ),
        isSelected || tabIndex == selectedTabIndex - 1 ? const SizedBox() : Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 1.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.0),
                  Color.fromRGBO(255, 255, 255, 0.1),
                  Color.fromRGBO(255, 255, 255, 0.0),
                ]
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3.0),
              topRight: Radius.circular(3.0),
            ),
            gradient: !isSelected ? null : const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.3),
                Color.fromRGBO(255, 255, 255, 0.12),
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.05),
                Color.fromRGBO(255, 255, 255, 0.02),
                Color.fromRGBO(255, 255, 255, 0.0),
              ]
            ),
          ),
        ),
      ],
    );
  }
}
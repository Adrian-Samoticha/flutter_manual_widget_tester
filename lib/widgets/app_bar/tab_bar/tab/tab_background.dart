import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class TabBackground extends StatelessWidget {
  const TabBackground({
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
          decoration: isSelected ? BoxDecoration( // TODO: add to theme settings
            color: themeSettings.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3.0),
              topRight: Radius.circular(3.0),
            ),
          ) : const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
        !isSelected ? const SizedBox() : Container( // TODO: add to theme settings
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
            decoration: const BoxDecoration( // TODO: add to theme settings
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
          decoration: BoxDecoration( // TODO: add to theme settings
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
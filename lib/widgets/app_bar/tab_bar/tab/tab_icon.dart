import 'package:flutter/material.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.isSelected,
    required this.isBeingHovered,
  }) : super(key: key);

  final IconData icon;
  final Color? iconColor;
  final bool isSelected;
  final bool isBeingHovered;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Padding(
        padding: const EdgeInsets.only(right: 4.0), // TODO: add to theme settings
        child: Icon(
          icon,
          size: 21.0, // TODO: add to theme settings
          color: iconColor,
        ),
      );
    }
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150), // TODO: add to theme settings
      opacity: isBeingHovered ? 0.7 : 0.4, // TODO: add to theme settings
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Icon(
          icon,
          size: 21.0,
          color: iconColor,
        ),
      ),
    );
  }
}
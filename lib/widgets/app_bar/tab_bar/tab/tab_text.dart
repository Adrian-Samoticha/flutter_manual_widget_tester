import 'package:flutter/material.dart';

class TabText extends StatelessWidget {
  const TabText({
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
          style: const TextStyle( // TODO: add to theme settings
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        )
      );
    }
    
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150), // TODO: add to theme settings
        opacity: isBeingHovered ? 0.7 : 0.4, // TODO: add to theme settings
        child: Text(
          widgetName,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: const TextStyle( // TODO: add to theme settings
            color:Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      )
    );
  }
}
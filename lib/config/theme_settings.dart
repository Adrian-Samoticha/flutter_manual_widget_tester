import 'package:flutter/widgets.dart';

class ManualWidgetTesterThemeSettings {
  final Color backgroundColor;
  final Color sidebarColor;
  final double appbarHeight;
  final Color accentColor;
  final double minTabWidth;
  final double maxTabWidth;
  final Color dottedLineColor;
  final Color defaultIconColor;
  final Color buttonColor;
  final Radius buttonCornerRadius;
  final List<BoxShadow> buttonShadow;
  final Color buttonPressedTint;
  final Color buttonHoveredTint;
  final Offset buttonPressedOffset;
  final Color buttonSeparatorColor;
  final double buttonSeparatorWidth;
  final IconThemeData disabledButtonIconTheme;
  final IconThemeData pressedButtonIconTheme;
  final IconThemeData buttonIconTheme;
  final TextStyle disabledButtonTextStyle;
  final TextStyle pressedButtonTextStyle;
  final TextStyle buttonTextStyle;
  
  const ManualWidgetTesterThemeSettings({
    this.backgroundColor = const Color.fromRGBO(41, 43, 53, 1.0),
    this.sidebarColor = const Color.fromRGBO(33, 37, 43, 1.0),
    this.appbarHeight = 40.0,
    this.accentColor = const Color.fromARGB(255, 40, 138, 251),
    this.minTabWidth = 64.0,
    this.maxTabWidth = 192.0,
    this.dottedLineColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.defaultIconColor = const Color.fromRGBO(64, 167, 255, 1.0),
    this.buttonColor = const Color.fromRGBO(45, 50, 59, 1.0),
    this.buttonCornerRadius = const Radius.circular(3.0),
    this.buttonShadow = const [
      BoxShadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.2), offset: Offset(0.0, 1.0))
    ],
    this.buttonPressedTint = const Color.fromRGBO(0, 0, 0, 0.1),
    this.buttonHoveredTint = const Color.fromRGBO(255, 255, 255, 0.05),
    this.buttonPressedOffset = const Offset(0.0, 0.5),
    this.buttonSeparatorColor = const Color.fromRGBO(0, 0, 0, 0.2),
    this.buttonSeparatorWidth = 1.2,
    this.disabledButtonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.25),
      size: 18.5,
    ),
    this.pressedButtonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      size: 18.5,
    ),
    this.buttonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      size: 18.5,
    ),
    this.disabledButtonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.25),
    ),
    this.pressedButtonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
    this.buttonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
  });
}
import 'dart:ui';

class ManualWidgetTesterThemeSettings {
  final Color backgroundColor;
  final Color sidebarColor;
  final double appbarHeight;
  final Color accentColor;
  final double minTabWidth;
  final double maxTabWidth;
  final Color dottedLineColor;
  final Color defaultIconColor;
  
  const ManualWidgetTesterThemeSettings({
    this.backgroundColor = const Color.fromRGBO(41, 43, 53, 1.0),
    this.sidebarColor = const Color.fromRGBO(33, 37, 43, 1.0),
    this.appbarHeight = 40.0,
    this.accentColor = const Color.fromARGB(255, 40, 138, 251),
    this.minTabWidth = 64.0,
    this.maxTabWidth = 192.0,
    this.dottedLineColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.defaultIconColor = const Color.fromRGBO(64, 167, 255, 1.0),
  });
}
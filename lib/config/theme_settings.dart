import 'package:flutter/material.dart';

class ManualWidgetTesterThemeSettings {
  final Color backgroundColor;
  final Color sidebarColor;
  final double appbarHeight;
  final Color accentColor;
  final double minTabWidth;
  final double maxTabWidth;
  final Color dottedLineColor;
  final TextStyle widgetSizeTextStyle;
  final Color defaultIconColor;
  final Color buttonColor;
  final Radius buttonBorderRadius;
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
  final List<BoxShadow> textFieldShadow;
  final Radius textFieldBorderRadius;
  final Color textFieldColor;
  final Color textFieldBorderColor;
  final double textFieldBorderWidth;
  final TextStyle textFieldTextStyle;
  final TextStyle textFieldSuffixStyle;
  final Color textFieldCursorColor;
  final Color textFieldSelectionColor;
  final EdgeInsetsGeometry textFieldContentPadding;
  final double zoomControlsWidth;
  final double zoomControlsHeight;
  final BorderRadius zoomControlsBorderRadius;
  final List<BoxShadow> zoomControlsShadow;
  final EdgeInsets zoomControlsPadding;
  final double zoomControlsSpaceBetweenTextBoxAndButtonRow;
  final double zoomControlsButtonRowWidth;
  final Icon zoomControlsZoomOutIcon;
  final Icon zoomControlsZoomInIcon;
  final double zoomControlsDistanceToBorder;
  final Alignment zoomControlsAlignment;
  final double foldableRegionIndentationAmount;
  final Duration foldableRegionAnimationDuration;
  final Alignment foldableRegionContentAlignment;
  final double foldableRegionHeaderHeight;
  final double foldableRegionFoldedHeaderOpacity;
  final Color foldableRegionHeaderColor;
  final Color foldableRegionChevronIconColor;
  final double foldableRegionChevronIconSize;
  final TextStyle foldableRegionHeadingStyle;
  final TextOverflow foldableRegionHeadingOverflow;
  
  const ManualWidgetTesterThemeSettings({
    this.backgroundColor = const Color.fromRGBO(41, 43, 53, 1.0),
    this.sidebarColor = const Color.fromRGBO(33, 37, 43, 1.0),
    this.appbarHeight = 40.0,
    this.accentColor = const Color.fromARGB(255, 40, 138, 251),
    this.minTabWidth = 64.0,
    this.maxTabWidth = 192.0,
    this.dottedLineColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.widgetSizeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      fontSize: 10.0,
    ),
    this.defaultIconColor = const Color.fromRGBO(64, 167, 255, 1.0),
    this.buttonColor = const Color.fromRGBO(45, 50, 59, 1.0),
    this.buttonBorderRadius = const Radius.circular(3.0),
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
    this.textFieldShadow = const [
      BoxShadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.2), offset: Offset(0.0, 1.0))
    ],
    this.textFieldBorderRadius = const Radius.circular(3.0),
    this.textFieldColor = const Color.fromARGB(255, 41, 45, 53),
    this.textFieldBorderColor = const Color.fromRGBO(255, 255, 255, 0.05),
    this.textFieldBorderWidth = 1.0,
    this.textFieldTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.textFieldSuffixStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.textFieldCursorColor = const Color.fromRGBO(4, 180, 255, 1.0),
    this.textFieldSelectionColor = const Color.fromRGBO(4, 180, 255, 0.67),
    this.textFieldContentPadding = const EdgeInsets.all(8.0),
    this.zoomControlsWidth = 128.0,
    this.zoomControlsHeight = 32.0,
    this.zoomControlsBorderRadius = const BorderRadius.all(
      Radius.circular(3.0),
    ),
    this.zoomControlsShadow = const [
      BoxShadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0.0, 1.0)),
    ],
    this.zoomControlsPadding = const EdgeInsets.all(3.5),
    this.zoomControlsSpaceBetweenTextBoxAndButtonRow = 0.5,
    this.zoomControlsButtonRowWidth = 64.0,
    this.zoomControlsZoomOutIcon = const Icon(Icons.zoom_out),
    this.zoomControlsZoomInIcon = const Icon(Icons.zoom_in),
    this.zoomControlsDistanceToBorder = 8.0,
    this.zoomControlsAlignment = Alignment.bottomCenter,
    this.foldableRegionIndentationAmount = 12.0,
    this.foldableRegionAnimationDuration = const Duration(milliseconds: 300),
    this.foldableRegionContentAlignment = Alignment.bottomLeft,
    this.foldableRegionHeaderHeight = 24.0,
    this.foldableRegionFoldedHeaderOpacity = 0.5,
    this.foldableRegionHeaderColor = const Color.fromRGBO(70, 79, 90, 1.0),
    this.foldableRegionChevronIconColor = Colors.white,
    this.foldableRegionChevronIconSize = 18.0,
    this.foldableRegionHeadingStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w700
    ),
    this.foldableRegionHeadingOverflow = TextOverflow.ellipsis,
  });
}
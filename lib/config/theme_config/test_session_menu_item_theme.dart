import 'package:flutter/material.dart';

class ManualWidgetTesterTestSessionMenuItemTheme {
  /// The height of a menu item in the “RUNNING TEST SESSIONS” area.
  final double testSessionMenuItemHeight;

  /// The opacity of an unfocused menu item in the “RUNNING TEST SESSIONS” area.
  final double testSessionMenuItemUnfocusedTabOpacity;

  /// The padding of a menu item in the “RUNNING TEST SESSIONS” area.
  final EdgeInsets testSessionMenuItemPadding;

  /// The padding of a menu item's close button in the “RUNNING TEST SESSIONS”
  /// area.
  final EdgeInsets testSessionMenuItemCloseButtonPadding;

  /// The size of a menu item's close button in the “RUNNING TEST SESSIONS”
  /// area.
  final double testSessionMenuItemCloseButtonSize;

  /// The text overflow behavior of a menu item in the “RUNNING TEST SESSIONS”
  /// area.
  final TextOverflow testSessionMenuItemTextOverflow;

  /// The text style of a menu item in the “RUNNING TEST SESSIONS” area.
  final TextStyle testSessionMenuItemTextStyle;

  /// The icon size of a menu item in the “RUNNING TEST SESSIONS” area.
  final double testSessionMenuItemIconSize;

  /// The hover tint decoration of a menu item in the “RUNNING TEST SESSIONS”
  /// area.
  final BoxDecoration testSessionMenuItemHoverTintDecoration;

  /// The icon padding of a menu item in the “RUNNING TEST SESSIONS” area.
  final EdgeInsets testSessionMenuItemTabIconPadding;

  /// The tint decoration of a focused menu item in the “RUNNING TEST SESSIONS”
  /// area.
  final BoxDecoration testSessionMenuItemFocusedTabTintDecoration;

  const ManualWidgetTesterTestSessionMenuItemTheme({
    this.testSessionMenuItemHeight = 24.0,
    this.testSessionMenuItemUnfocusedTabOpacity = 0.5,
    this.testSessionMenuItemPadding =
        const EdgeInsets.symmetric(horizontal: 8.0),
    this.testSessionMenuItemCloseButtonPadding =
        const EdgeInsets.only(left: 8.0),
    this.testSessionMenuItemCloseButtonSize = 12.0,
    this.testSessionMenuItemTextOverflow = TextOverflow.ellipsis,
    this.testSessionMenuItemTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    ),
    this.testSessionMenuItemIconSize = 18.0,
    this.testSessionMenuItemHoverTintDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.1),
    ),
    this.testSessionMenuItemTabIconPadding = const EdgeInsets.only(right: 8.0),
    this.testSessionMenuItemFocusedTabTintDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.15),
    ),
  });
}

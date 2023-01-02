import 'package:flutter/material.dart';

class ManualWidgetTesterCreateTestSessionDialogTheme {
  /// The width of the “create test session” button.
  final double createTestSessionDialogWidth;

  /// The padding of the “create test session” dialog.
  final EdgeInsets createTestSessionDialogPadding;

  /// The height factor of the “create test session” dialog's search result list
  /// in relation to the window's height.
  ///
  /// A height factor of 0.5 means that the search result list covers 50 % of
  /// the application window.
  final double createTestSessionDialogSearchResultsHeightFactor;

  /// The height of the “create test session” dialog's search bar.
  final double createTestSessionDialogSearchBarHeight;

  /// The padding of the “create test session” dialog's search results.
  final EdgeInsets createTestSessionDialogSearchResultsPadding;

  /// The height of a single item in the “create test session” dialog's search
  /// results.
  final double createTestSessionDialogSearchResultHeight;

  /// The box decoration of the “create test session” dialog's selected search
  /// result.
  final BoxDecoration createTestSessionDialogSelectedSearchResultDecoration;

  /// The box decoration of the “create test session” dialog's unselected search
  /// results.
  final BoxDecoration createTestSessionDialogUnselectedSearchResultDecoration;

  /// The text style of the “create test session” dialog's search results.
  final TextStyle createTestSessionDialogSearchResultTextStyle;

  /// The padding of the “create test session” dialog's search result icons.
  final EdgeInsets createTestSessionDialogSearchResultIconPadding;

  /// The size of the “create test session” dialog's search result icons.
  final double createTestSessionDialogSearchResultIconSize;

  /// The duration of the “create test session” dialog's search result fade
  /// animation.
  final Duration createTestSessionDialogSearchResultFadeDuration;

  /// The opacity of the “create test session” dialog's unselected search
  /// results.
  final double createTestSessionDialogUnselectedSearchResultOpacity;

  /// The text style of the “create test session” dialog's *“No matching
  /// results.”* text.
  final TextStyle createTestSessionDialogNoMatchingResultsTextStyle;

  const ManualWidgetTesterCreateTestSessionDialogTheme({
    this.createTestSessionDialogWidth = 512.0,
    this.createTestSessionDialogPadding = const EdgeInsets.all(8.0),
    this.createTestSessionDialogSearchResultsHeightFactor = 0.5,
    this.createTestSessionDialogSearchBarHeight = 32.0,
    this.createTestSessionDialogSearchResultsPadding =
        const EdgeInsets.only(top: 8.0),
    this.createTestSessionDialogSearchResultHeight = 28.0,
    this.createTestSessionDialogSelectedSearchResultDecoration =
        const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.15),
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.15),
        ),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    this.createTestSessionDialogUnselectedSearchResultDecoration =
        const BoxDecoration(),
    this.createTestSessionDialogSearchResultTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.createTestSessionDialogSearchResultIconPadding =
        const EdgeInsets.only(right: 8.0, left: 2.0),
    this.createTestSessionDialogSearchResultIconSize = 21.0,
    this.createTestSessionDialogSearchResultFadeDuration =
        const Duration(milliseconds: 100),
    this.createTestSessionDialogUnselectedSearchResultOpacity = 0.5,
    this.createTestSessionDialogNoMatchingResultsTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
  });
}

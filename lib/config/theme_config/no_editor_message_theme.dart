import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterNoEditorMessageTheme extends Equatable {
  /// The padding of the message that is displayed when no editor for a
  /// particular setting could be built.
  final EdgeInsets noEditorMessagePadding;

  /// The margin of the message that is displayed when no editor for a
  /// particular setting could be built.
  final EdgeInsets noEditorMessageMargin;

  /// The box decoration of the message that is displayed when no editor for a
  /// particular setting could be built.
  final BoxDecoration noEditorMessageDecoration;

  /// The text style of the message that is displayed when no editor for a
  /// particular setting could be built.
  final TextStyle noEditorTextStyle;

  /// The text style of the highlighted text of the message that is displayed
  /// when no editor for a particular setting could be built.
  final TextStyle noEditorHighlightedTextStyle;

  const ManualWidgetTesterNoEditorMessageTheme({
    this.noEditorMessagePadding = const EdgeInsets.all(8.0),
    this.noEditorMessageMargin = const EdgeInsets.all(8.0),
    this.noEditorMessageDecoration = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 128, 0, 1.0),
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.noEditorTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 128, 0, 1.0),
    ),
    this.noEditorHighlightedTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 192, 0, 1.0),
      fontStyle: FontStyle.italic,
    ),
  });

  @override
  List<Object?> get props => [
        noEditorMessagePadding,
        noEditorMessageMargin,
        noEditorMessageDecoration,
        noEditorTextStyle,
        noEditorHighlightedTextStyle,
      ];
}

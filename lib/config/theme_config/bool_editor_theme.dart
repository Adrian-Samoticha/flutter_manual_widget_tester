import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterBoolEditorTheme extends Equatable {
  /// The maximal width of a boolean editor.
  final double boolEditorMaxWidth;

  /// The space between the radio buttons in the boolean editor.
  final double boolEditorSpaceBetweenRadioButtons;

  /// The boolean editor's padding.
  final EdgeInsets boolEditorRadioButtonPadding;

  /// The height of the boolean editor.
  final double boolEditorHeight;

  const ManualWidgetTesterBoolEditorTheme({
    this.boolEditorMaxWidth = 192.0,
    this.boolEditorSpaceBetweenRadioButtons = 12.0,
    this.boolEditorRadioButtonPadding =
        const EdgeInsets.symmetric(vertical: 8.0),
    this.boolEditorHeight = 16.0,
  });

  @override
  List<Object?> get props => [
        boolEditorMaxWidth,
        boolEditorSpaceBetweenRadioButtons,
        boolEditorRadioButtonPadding,
        boolEditorHeight,
      ];
}

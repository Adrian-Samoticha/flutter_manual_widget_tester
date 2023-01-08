import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterCustomSettingHeadingTheme extends Equatable {
  /// The text style of a custom setting's heading.
  final TextStyle customSettingHeadingTextStyle;

  /// The text overflow behavior of a custom setting's heading.
  final TextOverflow customSettingHeadingOverflow;

  /// The padding of a custom setting's heading.
  final EdgeInsets customSettingHeadingPadding;

  const ManualWidgetTesterCustomSettingHeadingTheme({
    this.customSettingHeadingTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.customSettingHeadingOverflow = TextOverflow.ellipsis,
    this.customSettingHeadingPadding = const EdgeInsets.only(bottom: 5.0),
  });

  @override
  List<Object?> get props => [
        customSettingHeadingTextStyle,
        customSettingHeadingOverflow,
        customSettingHeadingPadding,
      ];
}

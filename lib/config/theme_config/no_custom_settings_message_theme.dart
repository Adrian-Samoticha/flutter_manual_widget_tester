import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterNoCustomSettingsMessageTheme extends Equatable {
  /// The padding of the message that is displayed when a test session has no
  /// custom settings.
  final EdgeInsets noCustomSettingsMessagePadding;

  /// The text style of the message that is displayed when a test session has
  /// no custom settings.
  final TextStyle noCustomSettingsMessageTextStyle;

  const ManualWidgetTesterNoCustomSettingsMessageTheme({
    this.noCustomSettingsMessagePadding = const EdgeInsets.all(8.0),
    this.noCustomSettingsMessageTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.75),
    ),
  });

  @override
  List<Object?> get props => [
        noCustomSettingsMessagePadding,
        noCustomSettingsMessageTextStyle,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterCustomSettingsTheme extends Equatable {
  /// The padding of a custom settings widget.
  final EdgeInsets customSettingsPadding;

  const ManualWidgetTesterCustomSettingsTheme({
    this.customSettingsPadding = const EdgeInsets.all(8.0),
  });

  @override
  List<Object?> get props => [
        customSettingsPadding,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterCreateTestSessionButton extends Equatable {
  /// The padding of the “create test session” button.
  final EdgeInsets createTestSessionButtonPadding;

  const ManualWidgetTesterCreateTestSessionButton({
    this.createTestSessionButtonPadding = const EdgeInsets.all(6.5),
  });

  @override
  List<Object?> get props => [
        createTestSessionButtonPadding,
      ];
}

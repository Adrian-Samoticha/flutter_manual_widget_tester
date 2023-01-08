import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterCloseButtonTheme extends Equatable {
  /// The box decoration of a close button's hover effect.
  final BoxDecoration closeButtonHoverDecoration;

  /// The close button's color.
  final Color closeButtonColor;

  const ManualWidgetTesterCloseButtonTheme({
    this.closeButtonHoverDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.2),
      borderRadius: BorderRadius.all(Radius.circular(1024.0)),
    ),
    this.closeButtonColor = const Color.fromRGBO(255, 255, 255, 0.9),
  });

  @override
  List<Object?> get props => [
        closeButtonHoverDecoration,
        closeButtonColor,
      ];
}

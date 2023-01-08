import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ManualWidgetTesterRadioButtonTheme extends Equatable {
  /// The widget to use as the selected radio button.
  final Widget selectedRadioButton;

  /// The widget to use as the unselected radio button.
  final Widget unselectedRadioButton;

  /// The space between a radio button and its label.
  final double spaceBetweenRadioButtonAndLabel;

  /// The text style of a selected radio buttons label.
  final TextStyle selectedRadioButtonLabelStyle;

  /// The text style of an unselected radio buttons label.
  final TextStyle unselectedRadioButtonLabelStyle;

  const ManualWidgetTesterRadioButtonTheme({
    this.selectedRadioButton = const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(64, 64, 64, 1.0),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(150, 150, 150, 1.0),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            blurRadius: 2.0,
            offset: Offset(0.5, 1.0),
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: FractionallySizedBox(
        widthFactor: 0.67,
        heightFactor: 0.67,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(24, 125, 192, 1.0)),
              BoxShadow(
                color: Color.fromRGBO(32, 175, 255, 1.0),
                spreadRadius: -2.0,
                blurRadius: 2.5,
                offset: Offset(-1.0, -1.0),
              ),
            ],
          ),
          child: FractionallySizedBox(
            widthFactor: 0.24,
            heightFactor: 0.24,
            alignment: Alignment(-0.35, -0.35),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.3),
                    Color.fromRGBO(255, 255, 255, 0.25),
                    Color.fromRGBO(255, 255, 255, 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    this.unselectedRadioButton = const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(52, 52, 52, 1.0),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(82, 82, 82, 1.0),
          ),
        ),
      ),
    ),
    this.spaceBetweenRadioButtonAndLabel = 12.0,
    this.selectedRadioButtonLabelStyle = const TextStyle(
      color: Colors.white,
    ),
    this.unselectedRadioButtonLabelStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
  });

  @override
  List<Object?> get props => [
        selectedRadioButton,
        unselectedRadioButton,
        spaceBetweenRadioButtonAndLabel,
        selectedRadioButtonLabelStyle,
        unselectedRadioButtonLabelStyle,
      ];
}

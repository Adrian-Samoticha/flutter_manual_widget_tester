import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'button_info.dart';

class ManualWidgetTesterButton extends StatefulWidget {
  final ManualWidgetTesterButtonInfo button;
  final List<ManualWidgetTesterButtonInfo> buttons;
  final int index;
  final bool disableRoundedCornersOnLeftSide;
  final bool disableRoundedCornersOnRightSide;

  const ManualWidgetTesterButton(
      {super.key,
      required this.button,
      required this.buttons,
      required this.index,
      required this.disableRoundedCornersOnLeftSide,
      required this.disableRoundedCornersOnRightSide});

  @override
  State<ManualWidgetTesterButton> createState() =>
      _ManualWidgetTesterButtonState();
}

class _ManualWidgetTesterButtonState extends State<ManualWidgetTesterButton> {
  bool _isBeingHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.button.onButtonDown == null &&
        widget.button.onButtonPressed == null;

    return _buildDefaultTextStyleAndIconTheme(
      isPressed: _isPressed,
      isDisabled: isDisabled,
      child: SizedBox.expand(
        child: MouseRegion(
          cursor: isDisabled
              ? SystemMouseCursors.forbidden
              : SystemMouseCursors.click,
          onEnter: (_) => setState(() {
            if (isDisabled) {
              return;
            }
            _isBeingHovered = true;
          }),
          onExit: (_) => setState(() {
            _isBeingHovered = false;
          }),
          child: GestureDetector(
            onTapDown: (_) => setState(() {
              if (isDisabled) {
                return;
              }
              _isPressed = true;

              if (widget.button.onButtonDown != null) {
                widget.button.onButtonDown!();
              }
            }),
            onTapUp: (_) => setState(() {
              _isPressed = false;
            }),
            onTapCancel: () => setState(() {
              _isPressed = false;
            }),
            onTap: () {
              if (widget.button.onButtonPressed != null) {
                widget.button.onButtonPressed!();
              }
            },
            child: _buildButtonStack(
              isDisabled: isDisabled,
            ),
          ),
        ),
      ),
    );
  }

  Stack _buildButtonStack({required bool isDisabled}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _isPressed
            ? Container(
                decoration: BoxDecoration(
                  color: ManualWidgetTesterTheme.of(context)
                      .buttonTheme
                      .buttonPressedTint,
                  borderRadius: _generateBorderRadius(
                    roundLeftCorners: widget.index == 0 &&
                        !widget.disableRoundedCornersOnLeftSide,
                    roundRightCorners:
                        widget.index == widget.buttons.length - 1 &&
                            !widget.disableRoundedCornersOnRightSide,
                  ),
                ),
              )
            : AnimatedOpacity(
                duration: const Duration(milliseconds: 50),
                opacity: _isBeingHovered ? 1.0 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: ManualWidgetTesterTheme.of(context)
                        .buttonTheme
                        .buttonHoveredTint,
                    borderRadius: _generateBorderRadius(
                      roundLeftCorners: widget.index == 0 &&
                          !widget.disableRoundedCornersOnLeftSide,
                      roundRightCorners:
                          widget.index == widget.buttons.length - 1 &&
                              !widget.disableRoundedCornersOnRightSide,
                    ),
                  ),
                ),
              ),
        Container(
          decoration: _generateButtonBoxDecoration(
            roundLeftCorners:
                widget.index == 0 && !widget.disableRoundedCornersOnLeftSide,
            roundRightCorners: widget.index == widget.buttons.length - 1 &&
                !widget.disableRoundedCornersOnRightSide,
            isPressed: _isPressed,
            isDisabled: isDisabled,
          ),
          child: Transform.translate(
            offset: _isPressed
                ? ManualWidgetTesterTheme.of(context)
                    .buttonTheme
                    .buttonPressedOffset
                : Offset.zero,
            child: widget.button.child,
          ),
        ),
        ...widget.index == 0
            ? const []
            : [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: ManualWidgetTesterTheme.of(context)
                        .buttonTheme
                        .separatorWidth,
                    color: ManualWidgetTesterTheme.of(context)
                        .buttonTheme
                        .separatorColor,
                  ),
                ),
              ]
      ],
    );
  }

  Widget _buildDefaultTextStyleAndIconTheme(
      {required Widget child,
      required bool isPressed,
      required bool isDisabled}) {
    if (isDisabled) {
      return IconTheme(
        data: ManualWidgetTesterTheme.of(context)
            .buttonTheme
            .disabledButtonIconTheme,
        child: DefaultTextStyle(
          style: ManualWidgetTesterTheme.of(context)
              .buttonTheme
              .disabledButtonTextStyle,
          softWrap: false,
          overflow: TextOverflow.fade,
          child: Container(
            child: child,
          ),
        ),
      );
    }

    if (isPressed) {
      return IconTheme(
        data: ManualWidgetTesterTheme.of(context)
            .buttonTheme
            .pressedButtonIconTheme,
        child: DefaultTextStyle(
          style: ManualWidgetTesterTheme.of(context)
              .buttonTheme
              .pressedButtonTextStyle,
          softWrap: false,
          overflow: TextOverflow.fade,
          child: Container(
            child: child,
          ),
        ),
      );
    }

    return IconTheme(
      data: ManualWidgetTesterTheme.of(context).buttonTheme.iconTheme,
      child: DefaultTextStyle(
        style: ManualWidgetTesterTheme.of(context).buttonTheme.textStyle,
        softWrap: false,
        overflow: TextOverflow.fade,
        child: Container(
          child: child,
        ),
      ),
    );
  }

  BorderRadius _generateBorderRadius(
      {required bool roundLeftCorners, required bool roundRightCorners}) {
    return BorderRadius.only(
      topLeft: roundLeftCorners
          ? ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius
          : Radius.zero,
      bottomLeft: roundLeftCorners
          ? ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius
          : Radius.zero,
      topRight: roundRightCorners
          ? ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius
          : Radius.zero,
      bottomRight: roundRightCorners
          ? ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius
          : Radius.zero,
    );
  }

  BoxDecoration _generateButtonBoxDecoration(
      {required bool roundLeftCorners,
      required bool roundRightCorners,
      required bool isPressed,
      required bool isDisabled}) {
    final gradientColors = _getButtonBoxDecorationGradientColors(
      isPressed: isPressed,
      isDisabled: isDisabled,
    );

    return BoxDecoration(
      border: ManualWidgetTesterTheme.of(context).buttonTheme.boxBorder,
      borderRadius: _generateBorderRadius(
          roundLeftCorners: roundLeftCorners,
          roundRightCorners: roundRightCorners),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: gradientColors,
      ),
    );
  }

  List<Color> _getButtonBoxDecorationGradientColors(
      {required bool isPressed, required bool isDisabled}) {
    if (isDisabled) {
      return const [
        Color.fromRGBO(255, 255, 255, 0.04),
        Color.fromRGBO(255, 255, 255, 0.0),
        Color.fromRGBO(255, 255, 255, 0.0),
      ];
    }

    if (isPressed) {
      return const [
        Color.fromRGBO(255, 255, 255, 0.0),
        Color.fromRGBO(255, 255, 255, 0.0),
        Color.fromRGBO(255, 255, 255, 0.0),
        Color.fromRGBO(255, 255, 255, 0.05),
      ];
    }

    return const [
      Color.fromRGBO(255, 255, 255, 0.1),
      Color.fromRGBO(255, 255, 255, 0.0),
      Color.fromRGBO(255, 255, 255, 0.0),
    ];
  }
}

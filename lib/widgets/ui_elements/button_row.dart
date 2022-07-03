import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class ManualWidgetTesterButtonInfo {
  final void Function()? onButtonDown;
  final void Function()? onButtonPressed;
  final Widget child;

  ManualWidgetTesterButtonInfo({required this.onButtonDown, required this.onButtonPressed, this.child = const SizedBox()});
}

class ManualWidgetTesterButtonRow extends StatelessWidget {
  const ManualWidgetTesterButtonRow({Key? key, required this.buttons, required this.themeSettings, this.disableRoundedCornersOnLeftSide = false, this.disableRoundedCornersOnRightSide = false}) : super(key: key);
  
  final List<ManualWidgetTesterButtonInfo> buttons;
  final ManualWidgetTesterThemeSettings themeSettings;
  final bool disableRoundedCornersOnLeftSide;
  final bool disableRoundedCornersOnRightSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeSettings.buttonColor,
        borderRadius: BorderRadius.only(
          topLeft: disableRoundedCornersOnLeftSide ? Radius.zero : themeSettings.buttonBorderRadius,
          bottomLeft: disableRoundedCornersOnLeftSide ? Radius.zero : themeSettings.buttonBorderRadius,
          topRight: disableRoundedCornersOnRightSide ? Radius.zero : themeSettings.buttonBorderRadius,
          bottomRight: disableRoundedCornersOnRightSide ? Radius.zero : themeSettings.buttonBorderRadius,
        ),
        boxShadow:themeSettings.buttonShadow,
      ),
      child: _generateButtons(),
    );
  }
  
  Widget _generateButtons() {
    return Row(
      children: buttons.asMap().map((int index, ManualWidgetTesterButtonInfo button) {
        final toBeReturnedWidget = Expanded(
          child: _ManualWidgetTesterButton(
            button: button,
            buttons: buttons,
            index: index,
            themeSettings: themeSettings,
            disableRoundedCornersOnLeftSide: disableRoundedCornersOnLeftSide,
            disableRoundedCornersOnRightSide: disableRoundedCornersOnRightSide,
          ),
        );
        
        return MapEntry(index, toBeReturnedWidget);
      }).values.toList(),
    );
  }
  
}

class _ManualWidgetTesterButton extends StatefulWidget {
  final ManualWidgetTesterButtonInfo button;
  final List<ManualWidgetTesterButtonInfo> buttons;
  final int index;
  final ManualWidgetTesterThemeSettings themeSettings;
  final bool disableRoundedCornersOnLeftSide;
  final bool disableRoundedCornersOnRightSide;

  const _ManualWidgetTesterButton({required this.button, required this.buttons, required this.index, required this.themeSettings, required this.disableRoundedCornersOnLeftSide, required this.disableRoundedCornersOnRightSide});

  @override
  State<_ManualWidgetTesterButton> createState() => _ManualWidgetTesterButtonState();
}

class _ManualWidgetTesterButtonState extends State<_ManualWidgetTesterButton> {
  bool _isBeingHovered = false;
  bool _isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.button.onButtonDown == null && widget.button.onButtonPressed == null;
    
    return _generateDefaultTextStyleAndIconTheme(
      isPressed: _isPressed,
      isDisabled: isDisabled,
      child: SizedBox.expand(
        child: MouseRegion(
          cursor: isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
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
            child: _generateButtonStack(
              isDisabled: isDisabled,
            ),
          ),
        ),
      ),
    );
  }

  Stack _generateButtonStack({required bool isDisabled}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _isPressed ? Container(
          color: widget.themeSettings.buttonPressedTint,
        ) :  AnimatedOpacity(
          duration: const Duration(milliseconds: 50),
          opacity: _isBeingHovered ? 1.0 : 0.0,
          child: Container(
            color: widget.themeSettings.buttonHoveredTint,
          ),
        ),
        Container(
          decoration: _generateButtonBoxDecoration(
            roundLeftCorners: widget.index == 0 && !widget.disableRoundedCornersOnLeftSide,
            roundRightCorners: widget.index == widget.buttons.length - 1 && !widget.disableRoundedCornersOnRightSide,
            isPressed: _isPressed,
            isDisabled: isDisabled,
          ),
          child: Transform.translate(
            offset: _isPressed ? widget.themeSettings.buttonPressedOffset : Offset.zero,
            child: widget.button.child,
          ),
        ),
        ...widget.index == 0 ? const [] : [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: widget.themeSettings.buttonSeparatorWidth,
              color: widget.themeSettings.buttonSeparatorColor,
            ),
          ),
        ]
      ],
    );
  }

  Widget _generateDefaultTextStyleAndIconTheme({required Widget child, required bool isPressed, required bool isDisabled}) {
    if (isDisabled) {
      return IconTheme(
        data: widget.themeSettings.disabledButtonIconTheme,
        child: DefaultTextStyle(
          style: widget.themeSettings.disabledButtonTextStyle,
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
        data: widget.themeSettings.pressedButtonIconTheme,
        child: DefaultTextStyle(
          style: widget.themeSettings.pressedButtonTextStyle,
          softWrap: false,
          overflow: TextOverflow.fade,
          child: Container(
            child: child,
          ),
        ),
      );
    }
    
    return IconTheme(
      data: widget.themeSettings.buttonIconTheme,
      child: DefaultTextStyle(
        style: widget.themeSettings.buttonTextStyle,
        softWrap: false,
        overflow: TextOverflow.fade,
        child: Container(
          child: child,
        ),
      ),
    );
  }

  BoxDecoration _generateButtonBoxDecoration({required bool roundLeftCorners, required bool roundRightCorners, required bool isPressed, required bool isDisabled}) {
    final gradientColors = _getButtonBoxDecorationGradientColors(
      isPressed: isPressed,
      isDisabled: isDisabled,
    );
    
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: roundLeftCorners ? widget.themeSettings.buttonBorderRadius : Radius.zero,
        bottomLeft: roundLeftCorners ? widget.themeSettings.buttonBorderRadius : Radius.zero,
        topRight: roundRightCorners ? widget.themeSettings.buttonBorderRadius : Radius.zero,
        bottomRight: roundRightCorners ? widget.themeSettings.buttonBorderRadius : Radius.zero,
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: gradientColors,
      ),
    );
  }
  
  List<Color> _getButtonBoxDecorationGradientColors({required bool isPressed, required bool isDisabled}) {
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
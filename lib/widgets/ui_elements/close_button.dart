import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class ManualWidgetTesterCloseButton extends StatefulWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final double size;
  final void Function() onPressed;

  const ManualWidgetTesterCloseButton(
      {Key? key,
      required this.themeSettings,
      this.size = 24.0,
      required this.onPressed})
      : super(key: key);

  @override
  State<ManualWidgetTesterCloseButton> createState() =>
      _ManualWidgetTesterCloseButtonState();
}

class _ManualWidgetTesterCloseButtonState
    extends State<ManualWidgetTesterCloseButton> {
  bool _isBeingHovered = false;
  bool _isBeingPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isBeingHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isBeingHovered = false;
        });
      },
      child: GestureDetector(
        onTapDown: (_) => setState(() {
          _isBeingPressed = true;
        }),
        onTapUp: (_) => setState(() {
          _isBeingPressed = false;
        }),
        onTapCancel: () => setState(() {
          _isBeingPressed = false;
        }),
        onTap: widget.onPressed,
        child: Transform.translate(
          offset: _isBeingPressed
              ? widget.themeSettings.buttonTheme.buttonPressedOffset
              : Offset.zero,
          child: Stack(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 50),
                opacity: _isBeingHovered ? 1.0 : 0.0,
                child: Container(
                  decoration: widget.themeSettings.closeButtonHoverDecoration,
                ),
              ),
              Center(
                child: Icon(
                  Icons.close,
                  color: widget.themeSettings.closeButtonColor,
                  size: widget.size,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

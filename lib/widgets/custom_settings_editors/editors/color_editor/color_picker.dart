import 'package:flex_color_picker/flex_color_picker.dart' as flex_color_picker;
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/util/dialog_generator.dart';

import 'checkerboard.dart';

class ColorPicker extends StatefulWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final Color selectedColor;
  final void Function(Color) onChanged;

  const ColorPicker({Key? key, required this.themeSettings, required this.selectedColor, required this.onChanged}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _colorWorkingCopy;
  bool _isBeingHovered = false;
  bool _isDialogOpen = false;
  
  @override
  void initState() {
    _colorWorkingCopy = widget.selectedColor;
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final isSelectedColorDark = widget.selectedColor.computeLuminance() < 0.5;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        _isBeingHovered = true;
      }),
      onExit: (_) => setState(() {
        _isBeingHovered = false;
      }),
      child: GestureDetector(
        onTap: () {
          _colorWorkingCopy = widget.selectedColor;
          setState(() {
            _isDialogOpen = true;
          });
          
          _showEditColorDialog(context);
        },
        child: Stack(
          children: [
            _generateCheckerboardBackground(),
            _generateColoredContainer(isSelectedColorDark, _isBeingHovered || _isDialogOpen),
          ],
        ),
      ),
    );
  }

  void _showEditColorDialog(BuildContext context) {
    return ManualWidgetTesterDialogGenerator.showEditSettingDialog(
      context: context,
      themeSettings: widget.themeSettings,
      onClose: () {
        setState(() {
          _isDialogOpen = false;
        });
      },
      onApply: () {
        widget.onChanged(_colorWorkingCopy);
      },
      editorBuilder: (BuildContext context) {
        return AnimatedSize(
          duration: widget.themeSettings.editColorDialogSizeChangeAnimationDuration,
          curve: widget.themeSettings.editColorDialogSizeChangeCurve,
          child: Material(
            type: MaterialType.transparency,
            child: flex_color_picker.ColorPicker(
              onColorChanged: (Color newColor) {
                setState(() {
                  _colorWorkingCopy = newColor;
                });
              },
              color: widget.selectedColor,
              enableOpacity: true,
              enableShadesSelection: true,
              enableTonalPalette: true,
              showColorName: true,
              elevation: widget.themeSettings.editColorDialogElevation,
              borderRadius: widget.themeSettings.editColorDialogBorderRadius,
              colorNameTextStyle: widget.themeSettings.editColorDialogColorNameTextStyle,
              pickerTypeTextStyle: widget.themeSettings.editColorDialogTypeTextStyle,
              selectedPickerTypeColor: widget.themeSettings.editColorDialogSelectedPickerTypeColor,
              spacing: widget.themeSettings.editColorDialogSpacing,
              runSpacing: widget.themeSettings.editColorDialogRunSpacing,
              columnSpacing: widget.themeSettings.editColorDialogColumnSpacing,
              showColorCode: true,
              colorCodeHasColor: true,
              pickersEnabled: const {
                flex_color_picker.ColorPickerType.primary: true,
                flex_color_picker.ColorPickerType.accent: true,
                flex_color_picker.ColorPickerType.wheel: true,
              },
            ),
          ),
        );
      }
    );
  }

  SizedBox _generateCheckerboardBackground() {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: widget.themeSettings.editColorButtonBorderRadius,
        child: Checkerboard(
          themeSettings: widget.themeSettings,
        ),
      ),
    );
  }

  Widget _generateColoredContainer(bool isSelectedColorDark, bool doShowEditIcon) {
    return Container(
      decoration: (isSelectedColorDark ? widget.themeSettings.editColorButtonDecorationForDarkColor : widget.themeSettings.editColorButtonDecorationForBrightColor).copyWith(
        color: widget.selectedColor,
        borderRadius: widget.themeSettings.editColorButtonBorderRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: _generateColorCodeText(isSelectedColorDark),
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: widget.themeSettings.editColorButtonIconAnimationDuration,
            tween: Tween<double>(begin: doShowEditIcon ? 1.0 : 0.0, end: doShowEditIcon ? 1.0 : 0.0),
            curve: widget.themeSettings.editColorButtonIconAnimationCurve,
            builder: (BuildContext context, double animationValue, Widget? child) {
              return Opacity(
                opacity: animationValue.clamp(0.0, 1.0),
                child: ClipRect(
                  child: Align(
                    widthFactor: animationValue,
                    child: child,
                  ),
                ),
              );
            },
            child: Icon(
              widget.themeSettings.editColorButtonIcon,
              color: isSelectedColorDark ? widget.themeSettings.editColorButtonIconColorForDarkColor : widget.themeSettings.editColorButtonIconColorForBrightColor,
              shadows: isSelectedColorDark ? widget.themeSettings.editColorButtonIconShadowsForDarkColor : widget.themeSettings.editColorButtonIconShadowsForBrightColor,
            ),
          ),
        ],
      ),
    );
  }

  Text _generateColorCodeText(bool isSelectedColorDark) {
    return Text(
      _generateColorCodeString(),
      overflow: TextOverflow.fade,
      softWrap: false,
      style: isSelectedColorDark ? widget.themeSettings.editColorButtonTextStyleForDarkColor : widget.themeSettings.editColorButtonTextStyleForBrightColor,
    );
  }

  String _generateColorCodeString() {
    final rawColorString = widget.selectedColor.value.toRadixString(16).toUpperCase().padLeft(8, '0');
    return '0x$rawColorString';
  }
}

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/dialog_generator.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/heading.dart';

class ManualWidgetTesterCustomSettingsColorEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsColorEditor({Key? key, required this.themeSettings, required this.settingName, required this.currentValue, required this.onChanged}) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final Color currentValue;
  final void Function(Color) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(themeSettings: themeSettings, settingName: settingName),
          SizedBox(
            height: themeSettings.editColorButtonHeight,
            child: _ColorPicker(
              themeSettings: themeSettings,
              selectedColor: currentValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorPicker extends StatefulWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final Color selectedColor;
  final void Function(Color) onChanged;

  const _ColorPicker({required this.themeSettings, required this.selectedColor, required this.onChanged});

  @override
  State<_ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<_ColorPicker> {
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
            child: ColorPicker(
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
              pickersEnabled: const {
                ColorPickerType.primary: true,
                ColorPickerType.accent: true,
                ColorPickerType.wheel: true,
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
        child: CustomPaint(
          painter: _CheckerboardPainter(
            widget.themeSettings.editColorButtonCheckerboardSize,
            widget.themeSettings.editColorButtonCheckerboardColor1,
            widget.themeSettings.editColorButtonCheckerboardColor2,
          ),
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


class _CheckerboardPainter extends CustomPainter {
  final double tileSize;
  final Color color1;
  final Color color2;

  _CheckerboardPainter(this.tileSize, this.color1, this.color2);
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = color1;
      
    final paint2 = Paint()
      ..color = color2;
      
    final widthInTiles = size.width / tileSize;
    final heightInTiles = size.height / tileSize;
      
    for (var x = 0; x < widthInTiles; x += 1) {
      for (var y = 0; y < heightInTiles; y += 1) {
        final paint = (x + y) % 2 == 0 ? paint1 : paint2;
        final rect = Rect.fromLTWH(x * tileSize, y * tileSize, tileSize, tileSize);
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
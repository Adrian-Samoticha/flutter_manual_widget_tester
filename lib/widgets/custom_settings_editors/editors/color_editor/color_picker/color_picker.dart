import 'package:flex_color_picker/flex_color_picker.dart' as flex_color_picker;
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/util/dialog_generator.dart';

import 'checkerboard.dart';
import 'colored_container.dart';

class ColorPicker extends StatefulWidget {
  final Color selectedColor;
  final void Function(Color) onChanged;

  const ColorPicker(
      {Key? key, required this.selectedColor, required this.onChanged})
      : super(key: key);

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
            _buildCheckerboardBackground(),
            ColoredContainer(
              isSelectedColorDark: isSelectedColorDark,
              doShowEditIcon: _isBeingHovered || _isDialogOpen,
              selectedColor: widget.selectedColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showEditColorDialog(BuildContext context) {
    return ManualWidgetTesterDialogGenerator.showEditSettingDialog(
        context: context,
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
            duration: ManualWidgetTesterTheme.of(context)
                .dialogTheme
                .editColorDialogSizeChangeAnimationDuration,
            curve: ManualWidgetTesterTheme.of(context)
                .dialogTheme
                .editColorDialogSizeChangeCurve,
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
                elevation: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogElevation,
                borderRadius: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogBorderRadius,
                colorNameTextStyle: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogColorNameTextStyle,
                pickerTypeTextStyle: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogPickerTypeTextStyle,
                selectedPickerTypeColor: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogSelectedPickerTypeColor,
                spacing: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogSpacing,
                runSpacing: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogRunSpacing,
                columnSpacing: ManualWidgetTesterTheme.of(context)
                    .dialogTheme
                    .editColorDialogColumnSpacing,
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
        });
  }

  SizedBox _buildCheckerboardBackground() {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: ManualWidgetTesterTheme.of(context)
            .editColorButtonTheme
            .editColorButtonBorderRadius,
        child: const Checkerboard(),
      ),
    );
  }
}

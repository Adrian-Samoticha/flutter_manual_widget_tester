import 'package:flex_color_picker/flex_color_picker.dart' as flex_color_picker;
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/util/dialog_generator.dart';

import 'checkerboard.dart';
import 'colored_container.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.selectedColor,
    required this.onChanged,
  });

  final Color selectedColor;
  final void Function(Color) onChanged;

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
              .editColorDialogTheme
              .sizeChangeAnimationDuration,
          curve: ManualWidgetTesterTheme.of(context)
              .editColorDialogTheme
              .sizeChangeAnimationCurve,
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
                  .editColorDialogTheme
                  .elevation,
              borderRadius: ManualWidgetTesterTheme.of(context)
                  .editColorDialogTheme
                  .borderRadius,
              colorNameTextStyle: ManualWidgetTesterTheme.of(context)
                  .editColorDialogTheme
                  .colorNameTextStyle,
              pickerTypeTextStyle: ManualWidgetTesterTheme.of(context)
                  .editColorDialogTheme
                  .pickerTypeTextStyle,
              selectedPickerTypeColor: ManualWidgetTesterTheme.of(context)
                  .editColorDialogTheme
                  .selectedPickerTypeColor,
              spacing: ManualWidgetTesterTheme.of(context)
                  .editColorDialogTheme
                  .spacing,
              runSpacing: ManualWidgetTesterTheme.of(context)
                  .editColorDialogTheme
                  .runSpacing,
              columnSpacing: ManualWidgetTesterTheme.of(context)
                  .editColorDialogTheme
                  .columnSpacing,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSelectedColorDark = widget.selectedColor.computeLuminance() < 0.5;

    return RepaintBoundary(
      child: MouseRegion(
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
              const _CheckerBoardBackground(),
              ColoredContainer(
                isSelectedColorDark: isSelectedColorDark,
                doShowEditIcon: _isBeingHovered || _isDialogOpen,
                selectedColor: widget.selectedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckerBoardBackground extends StatelessWidget {
  const _CheckerBoardBackground();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: ManualWidgetTesterTheme.of(context)
            .editColorButtonTheme
            .borderRadius,
        child: const Checkerboard(),
      ),
    );
  }
}

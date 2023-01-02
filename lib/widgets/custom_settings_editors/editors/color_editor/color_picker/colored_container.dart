import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer(
      {Key? key,
      required this.isSelectedColorDark,
      required this.doShowEditIcon,
      required this.selectedColor,
      required this.themeSettings})
      : super(key: key);

  final bool isSelectedColorDark;
  final bool doShowEditIcon;
  final Color selectedColor;
  final ManualWidgetTesterThemeSettings themeSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (isSelectedColorDark
              ? themeSettings
                  .editColorButtonTheme.editColorButtonDecorationForDarkColor
              : themeSettings
                  .editColorButtonTheme.editColorButtonDecorationForBrightColor)
          .copyWith(
        color: selectedColor,
        borderRadius:
            themeSettings.editColorButtonTheme.editColorButtonBorderRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: _buildColorCodeText(isSelectedColorDark),
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: themeSettings
                .editColorButtonTheme.editColorButtonIconAnimationDuration,
            tween: Tween<double>(
                begin: doShowEditIcon ? 1.0 : 0.0,
                end: doShowEditIcon ? 1.0 : 0.0),
            curve: themeSettings
                .editColorButtonTheme.editColorButtonIconAnimationCurve,
            builder:
                (BuildContext context, double animationValue, Widget? child) {
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
              themeSettings.editColorButtonTheme.editColorButtonIcon,
              color: isSelectedColorDark
                  ? themeSettings
                      .editColorButtonTheme.editColorButtonIconColorForDarkColor
                  : themeSettings.editColorButtonTheme
                      .editColorButtonIconColorForBrightColor,
              shadows: isSelectedColorDark
                  ? themeSettings.editColorButtonTheme
                      .editColorButtonIconShadowsForDarkColor
                  : themeSettings.editColorButtonTheme
                      .editColorButtonIconShadowsForBrightColor,
            ),
          ),
        ],
      ),
    );
  }

  Text _buildColorCodeText(bool isSelectedColorDark) {
    return Text(
      _generateColorCodeString(),
      overflow: TextOverflow.fade,
      softWrap: false,
      style: isSelectedColorDark
          ? themeSettings
              .editColorButtonTheme.editColorButtonTextStyleForDarkColor
          : themeSettings
              .editColorButtonTheme.editColorButtonTextStyleForBrightColor,
    );
  }

  String _generateColorCodeString() {
    final rawColorString =
        selectedColor.value.toRadixString(16).toUpperCase().padLeft(8, '0');
    return '0x$rawColorString';
  }
}

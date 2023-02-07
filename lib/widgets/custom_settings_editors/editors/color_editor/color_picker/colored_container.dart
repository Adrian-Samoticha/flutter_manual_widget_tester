import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({
    super.key,
    required this.isSelectedColorDark,
    required this.doShowEditIcon,
    required this.selectedColor,
  });

  final bool isSelectedColorDark;
  final bool doShowEditIcon;
  final Color selectedColor;

  Text _buildColorCodeText(BuildContext context, bool isSelectedColorDark) {
    return Text(
      _generateColorCodeString(),
      overflow: TextOverflow.fade,
      softWrap: false,
      style: isSelectedColorDark
          ? ManualWidgetTesterTheme.of(context)
              .editColorButtonTheme
              .textStyleForDarkColor
          : ManualWidgetTesterTheme.of(context)
              .editColorButtonTheme
              .textStyleForBrightColor,
    );
  }

  String _generateColorCodeString() {
    final rawColorString =
        selectedColor.value.toRadixString(16).toUpperCase().padLeft(8, '0');

    return '0x$rawColorString';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (isSelectedColorDark
              ? ManualWidgetTesterTheme.of(context)
                  .editColorButtonTheme
                  .decorationForDarkColor
              : ManualWidgetTesterTheme.of(context)
                  .editColorButtonTheme
                  .decorationForBrightColor)
          .copyWith(
        color: selectedColor,
        borderRadius: ManualWidgetTesterTheme.of(context)
            .editColorButtonTheme
            .borderRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: _buildColorCodeText(context, isSelectedColorDark),
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: ManualWidgetTesterTheme.of(context)
                .editColorButtonTheme
                .iconAnimationDuration,
            tween: Tween<double>(
              begin: doShowEditIcon ? 1.0 : 0.0,
              end: doShowEditIcon ? 1.0 : 0.0,
            ),
            curve: ManualWidgetTesterTheme.of(context)
                .editColorButtonTheme
                .iconAnimationCurve,
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
              ManualWidgetTesterTheme.of(context).editColorButtonTheme.icon,
              color: isSelectedColorDark
                  ? ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .iconColorForDarkColor
                  : ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .iconColorForBrightColor,
              shadows: isSelectedColorDark
                  ? ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .iconShadowsForDarkColor
                  : ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .iconShadowsForBrightColor,
            ),
          ),
        ],
      ),
    );
  }
}

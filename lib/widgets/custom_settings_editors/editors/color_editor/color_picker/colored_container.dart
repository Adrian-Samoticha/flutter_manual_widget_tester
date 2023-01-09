import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer(
      {Key? key,
      required this.isSelectedColorDark,
      required this.doShowEditIcon,
      required this.selectedColor})
      : super(key: key);

  final bool isSelectedColorDark;
  final bool doShowEditIcon;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (isSelectedColorDark
              ? ManualWidgetTesterTheme.of(context)
                  .editColorButtonTheme
                  .editColorButtonDecorationForDarkColor
              : ManualWidgetTesterTheme.of(context)
                  .editColorButtonTheme
                  .editColorButtonDecorationForBrightColor)
          .copyWith(
        color: selectedColor,
        borderRadius: ManualWidgetTesterTheme.of(context)
            .editColorButtonTheme
            .editColorButtonBorderRadius,
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
                .editColorButtonIconAnimationDuration,
            tween: Tween<double>(
                begin: doShowEditIcon ? 1.0 : 0.0,
                end: doShowEditIcon ? 1.0 : 0.0),
            curve: ManualWidgetTesterTheme.of(context)
                .editColorButtonTheme
                .editColorButtonIconAnimationCurve,
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
              ManualWidgetTesterTheme.of(context)
                  .editColorButtonTheme
                  .editColorButtonIcon,
              color: isSelectedColorDark
                  ? ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .editColorButtonIconColorForDarkColor
                  : ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .editColorButtonIconColorForBrightColor,
              shadows: isSelectedColorDark
                  ? ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .editColorButtonIconShadowsForDarkColor
                  : ManualWidgetTesterTheme.of(context)
                      .editColorButtonTheme
                      .editColorButtonIconShadowsForBrightColor,
            ),
          ),
        ],
      ),
    );
  }

  Text _buildColorCodeText(BuildContext context, bool isSelectedColorDark) {
    return Text(
      _generateColorCodeString(),
      overflow: TextOverflow.fade,
      softWrap: false,
      style: isSelectedColorDark
          ? ManualWidgetTesterTheme.of(context)
              .editColorButtonTheme
              .editColorButtonTextStyleForDarkColor
          : ManualWidgetTesterTheme.of(context)
              .editColorButtonTheme
              .editColorButtonTextStyleForBrightColor,
    );
  }

  String _generateColorCodeString() {
    final rawColorString =
        selectedColor.value.toRadixString(16).toUpperCase().padLeft(8, '0');
    return '0x$rawColorString';
  }
}

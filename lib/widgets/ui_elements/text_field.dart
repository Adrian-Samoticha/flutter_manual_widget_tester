import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';

class ManualWidgetTesterTextField extends StatelessWidget {
  final String? initialValue;
  final bool disableRoundedCornersOnLeftSide;
  final bool disableRoundedCornersOnRightSide;
  final void Function(String) onSubmitted;
  final void Function(String)? onChanged;
  final String suffix;
  final ManualWidgetTesterThemeSettings themeSettings;
  final bool autofocus;
  final TextEditingController? textEditingController;

  const ManualWidgetTesterTextField(
      {Key? key,
      this.initialValue,
      this.disableRoundedCornersOnLeftSide = false,
      this.disableRoundedCornersOnRightSide = false,
      required this.onSubmitted,
      this.suffix = '',
      required this.themeSettings,
      this.autofocus = false,
      this.onChanged,
      this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Do not render the text field when there is not enough available space,
      // as attempting to do so may cause exceptions to be thrown.
      if (constraints.maxWidth <= 32.0 || constraints.maxHeight <= 8.0) {
        return const SizedBox();
      }

      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: themeSettings.textFieldTheme.textFieldColor,
            boxShadow: themeSettings.textFieldTheme.textFieldShadow,
            borderRadius: BorderRadius.only(
              topLeft: disableRoundedCornersOnLeftSide
                  ? Radius.zero
                  : themeSettings.textFieldTheme.textFieldBorderRadius,
              bottomLeft: disableRoundedCornersOnLeftSide
                  ? Radius.zero
                  : themeSettings.textFieldTheme.textFieldBorderRadius,
              topRight: disableRoundedCornersOnRightSide
                  ? Radius.zero
                  : themeSettings.textFieldTheme.textFieldBorderRadius,
              bottomRight: disableRoundedCornersOnRightSide
                  ? Radius.zero
                  : themeSettings.textFieldTheme.textFieldBorderRadius,
            ),
            border: Border.all(
              color: themeSettings.textFieldTheme.textFieldBorderColor,
              width: themeSettings.textFieldTheme.textFieldBorderWidth,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: disableRoundedCornersOnLeftSide
                    ? Radius.zero
                    : themeSettings.textFieldTheme.textFieldBorderRadius,
                bottomLeft: disableRoundedCornersOnLeftSide
                    ? Radius.zero
                    : themeSettings.textFieldTheme.textFieldBorderRadius,
                topRight: disableRoundedCornersOnRightSide
                    ? Radius.zero
                    : themeSettings.textFieldTheme.textFieldBorderRadius,
                bottomRight: disableRoundedCornersOnRightSide
                    ? Radius.zero
                    : themeSettings.textFieldTheme.textFieldBorderRadius,
              ),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.0),
                  Color.fromRGBO(255, 255, 255, 0.0),
                  Color.fromRGBO(255, 255, 255, 0.025),
                  Color.fromRGBO(255, 255, 255, 0.035),
                ],
              ),
            ),
            child: Center(
              child: _buildTextField(context),
            ),
          ),
        ),
      );
    });
  }

  Material _buildTextField(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor:
                themeSettings.textFieldTheme.textFieldSelectionColor,
          ),
        ),
        child: TextField(
          controller: textEditingController ??
              TextEditingController(
                text: initialValue,
              ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                themeSettings.textFieldTheme.textFieldContentPadding,
            border: InputBorder.none,
            suffixText: suffix,
            suffixStyle: themeSettings.textFieldTheme.textFieldSuffixStyle,
          ),
          style: themeSettings.textFieldTheme.textFieldTextStyle,
          cursorColor: themeSettings.textFieldTheme.textFieldCursorColor,
          autocorrect: false,
          autofocus: autofocus,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

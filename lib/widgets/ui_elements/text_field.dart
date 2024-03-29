import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ManualWidgetTesterTextField extends StatelessWidget {
  const ManualWidgetTesterTextField({
    super.key,
    this.initialValue,
    this.disableRoundedCornersOnLeftSide = false,
    this.disableRoundedCornersOnRightSide = false,
    required this.onSubmitted,
    this.suffix = '',
    this.autofocus = false,
    this.onChanged,
    this.textEditingController,
  });

  final String? initialValue;
  final bool disableRoundedCornersOnLeftSide;
  final bool disableRoundedCornersOnRightSide;
  final void Function(String) onSubmitted;
  final void Function(String)? onChanged;
  final String suffix;
  final bool autofocus;
  final TextEditingController? textEditingController;

  Material _buildTextField(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: ManualWidgetTesterTheme.of(context)
                .textFieldTheme
                .selectionColor,
          ),
        ),
        child: TextField(
          controller: textEditingController ??
              TextEditingController(
                text: initialValue,
              ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: ManualWidgetTesterTheme.of(context)
                .textFieldTheme
                .contentPadding,
            border: InputBorder.none,
            suffixText: suffix,
            suffixStyle:
                ManualWidgetTesterTheme.of(context).textFieldTheme.suffixStyle,
          ),
          style: ManualWidgetTesterTheme.of(context).textFieldTheme.textStyle,
          cursorColor:
              ManualWidgetTesterTheme.of(context).textFieldTheme.cursorColor,
          autocorrect: false,
          autofocus: autofocus,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }

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
            color: ManualWidgetTesterTheme.of(context).textFieldTheme.color,
            boxShadow:
                ManualWidgetTesterTheme.of(context).textFieldTheme.shadow,
            borderRadius: BorderRadius.only(
              topLeft: disableRoundedCornersOnLeftSide
                  ? Radius.zero
                  : ManualWidgetTesterTheme.of(context)
                      .textFieldTheme
                      .borderRadius,
              bottomLeft: disableRoundedCornersOnLeftSide
                  ? Radius.zero
                  : ManualWidgetTesterTheme.of(context)
                      .textFieldTheme
                      .borderRadius,
              topRight: disableRoundedCornersOnRightSide
                  ? Radius.zero
                  : ManualWidgetTesterTheme.of(context)
                      .textFieldTheme
                      .borderRadius,
              bottomRight: disableRoundedCornersOnRightSide
                  ? Radius.zero
                  : ManualWidgetTesterTheme.of(context)
                      .textFieldTheme
                      .borderRadius,
            ),
            border: Border.all(
              color: ManualWidgetTesterTheme.of(context)
                  .textFieldTheme
                  .borderColor,
              width: ManualWidgetTesterTheme.of(context)
                  .textFieldTheme
                  .borderWidth,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: disableRoundedCornersOnLeftSide
                    ? Radius.zero
                    : ManualWidgetTesterTheme.of(context)
                        .textFieldTheme
                        .borderRadius,
                bottomLeft: disableRoundedCornersOnLeftSide
                    ? Radius.zero
                    : ManualWidgetTesterTheme.of(context)
                        .textFieldTheme
                        .borderRadius,
                topRight: disableRoundedCornersOnRightSide
                    ? Radius.zero
                    : ManualWidgetTesterTheme.of(context)
                        .textFieldTheme
                        .borderRadius,
                bottomRight: disableRoundedCornersOnRightSide
                    ? Radius.zero
                    : ManualWidgetTesterTheme.of(context)
                        .textFieldTheme
                        .borderRadius,
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
}

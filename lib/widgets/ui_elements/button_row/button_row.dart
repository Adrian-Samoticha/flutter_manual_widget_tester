import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'button.dart';
import 'button_info.dart';

export 'button_info.dart';

class ManualWidgetTesterButtonRow extends StatelessWidget {
  const ManualWidgetTesterButtonRow({
    super.key,
    required this.buttons,
    this.disableRoundedCornersOnLeftSide = false,
    this.disableRoundedCornersOnRightSide = false,
  });

  final List<ManualWidgetTesterButtonInfo> buttons;
  final bool disableRoundedCornersOnLeftSide;
  final bool disableRoundedCornersOnRightSide;

  Widget _buildButtons() {
    return Row(
      children: buttons
          .asMap()
          .map((int index, ManualWidgetTesterButtonInfo button) {
            final toBeReturnedWidget = Expanded(
              child: ManualWidgetTesterButton(
                button: button,
                buttons: buttons,
                index: index,
                disableRoundedCornersOnLeftSide:
                    disableRoundedCornersOnLeftSide,
                disableRoundedCornersOnRightSide:
                    disableRoundedCornersOnRightSide,
              ),
            );

            return MapEntry(index, toBeReturnedWidget);
          })
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          color: ManualWidgetTesterTheme.of(context).buttonTheme.color,
          borderRadius: BorderRadius.only(
            topLeft: disableRoundedCornersOnLeftSide
                ? Radius.zero
                : ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius,
            bottomLeft: disableRoundedCornersOnLeftSide
                ? Radius.zero
                : ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius,
            topRight: disableRoundedCornersOnRightSide
                ? Radius.zero
                : ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius,
            bottomRight: disableRoundedCornersOnRightSide
                ? Radius.zero
                : ManualWidgetTesterTheme.of(context).buttonTheme.borderRadius,
          ),
          boxShadow: ManualWidgetTesterTheme.of(context).buttonTheme.shadow,
        ),
        child: _buildButtons(),
      ),
    );
  }
}

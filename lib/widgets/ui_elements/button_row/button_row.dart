import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

import 'button.dart';
import 'button_info.dart';

export 'button_info.dart';

class ManualWidgetTesterButtonRow extends StatelessWidget {
  const ManualWidgetTesterButtonRow({Key? key, required this.buttons, required this.themeSettings, this.disableRoundedCornersOnLeftSide = false, this.disableRoundedCornersOnRightSide = false}) : super(key: key);
  
  final List<ManualWidgetTesterButtonInfo> buttons;
  final ManualWidgetTesterThemeSettings themeSettings;
  final bool disableRoundedCornersOnLeftSide;
  final bool disableRoundedCornersOnRightSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeSettings.buttonColor,
        borderRadius: BorderRadius.only(
          topLeft: disableRoundedCornersOnLeftSide ? Radius.zero : themeSettings.buttonBorderRadius,
          bottomLeft: disableRoundedCornersOnLeftSide ? Radius.zero : themeSettings.buttonBorderRadius,
          topRight: disableRoundedCornersOnRightSide ? Radius.zero : themeSettings.buttonBorderRadius,
          bottomRight: disableRoundedCornersOnRightSide ? Radius.zero : themeSettings.buttonBorderRadius,
        ),
        boxShadow:themeSettings.buttonShadow,
      ),
      child: _buildButtons(),
    );
  }
  
  Widget _buildButtons() {
    return Row(
      children: buttons.asMap().map((int index, ManualWidgetTesterButtonInfo button) {
        final toBeReturnedWidget = Expanded(
          child: ManualWidgetTesterButton(
            button: button,
            buttons: buttons,
            index: index,
            themeSettings: themeSettings,
            disableRoundedCornersOnLeftSide: disableRoundedCornersOnLeftSide,
            disableRoundedCornersOnRightSide: disableRoundedCornersOnRightSide,
          ),
        );
        
        return MapEntry(index, toBeReturnedWidget);
      }).values.toList(),
    );
  }
  
}

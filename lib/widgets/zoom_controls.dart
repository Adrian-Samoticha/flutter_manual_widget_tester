import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

class ManualWidgetTesterZoomControls extends StatelessWidget {
  final ManualWidgetTesterThemeSettings themeSettings;
  final double zoom;
  final void Function() onZoomOutButtonPressed;
  final void Function() onZoomInButtonPressed;
  final void Function(double) onZoomChanged;
  final double minZoom;
  final double maxZoom;
  
  const ManualWidgetTesterZoomControls({Key? key,
  required this.themeSettings, required this.zoom, required this.onZoomOutButtonPressed, required this.onZoomInButtonPressed, required this.minZoom, required this.maxZoom, required this.onZoomChanged}) : super(key: key);

  @override
  Widget build(Object context) {
    return Container(
      width: themeSettings.zoomControlsWidth,
      height: themeSettings.zoomControlsHeight,
      decoration: BoxDecoration(
        color: themeSettings.sidebarColor,
        borderRadius: themeSettings.zoomControlsBorderRadius,
        boxShadow: themeSettings.zoomControlsShadow,
      ),
      child: Padding(
        padding: themeSettings.zoomControlsPadding,
        child: Row(
          children: [
            Expanded(
              child: ManualWidgetTesterTextField(
                themeSettings: themeSettings,
                initialValue: '${(zoom * 100).round()}',
                disableRoundedCornersOnRightSide: true,
                onSubmitted: (text) {
                  final percent = double.tryParse(text) ?? zoom * 100.0;
                  onZoomChanged(percent * (1.0 / 100.0));
                },
                suffix: '%',
              ),
            ),
            SizedBox(width: themeSettings.zoomControlsSpaceBetweenTextBoxAndButtonRow),
            SizedBox(
              width: themeSettings.zoomControlsButtonRowWidth,
              child: ManualWidgetTesterButtonRow(
                themeSettings: themeSettings,
                disableRoundedCornersOnLeftSide: true,
                buttons: [
                  ManualWidgetTesterButtonInfo(
                    onButtonDown: zoom > minZoom ? onZoomOutButtonPressed : null,
                    onButtonPressed: null,
                    child: themeSettings.zoomControlsZoomOutIcon,
                  ),
                  ManualWidgetTesterButtonInfo(
                    onButtonDown: zoom < maxZoom ? onZoomInButtonPressed : null,
                    onButtonPressed: null,
                    child: themeSettings.zoomControlsZoomInIcon,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
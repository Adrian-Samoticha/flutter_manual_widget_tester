import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';

class ManualWidgetTesterZoomControls extends StatelessWidget {
  const ManualWidgetTesterZoomControls({
    super.key,
    required this.zoom,
    required this.onZoomOutButtonPressed,
    required this.onZoomInButtonPressed,
    required this.minZoom,
    required this.maxZoom,
    required this.onZoomChanged,
  });

  final double zoom;
  final void Function() onZoomOutButtonPressed;
  final void Function() onZoomInButtonPressed;
  final void Function(double) onZoomChanged;
  final double minZoom;
  final double maxZoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManualWidgetTesterTheme.of(context).zoomControlsTheme.width,
      height: ManualWidgetTesterTheme.of(context).zoomControlsTheme.height,
      decoration: BoxDecoration(
        color: ManualWidgetTesterTheme.of(context).generalTheme.sidebarColor,
        borderRadius:
            ManualWidgetTesterTheme.of(context).zoomControlsTheme.borderRadius,
        boxShadow: ManualWidgetTesterTheme.of(context).zoomControlsTheme.shadow,
      ),
      child: Padding(
        padding: ManualWidgetTesterTheme.of(context).zoomControlsTheme.padding,
        child: Row(
          children: [
            Expanded(
              child: ManualWidgetTesterTextField(
                initialValue: '${(zoom * 100).round()}',
                disableRoundedCornersOnRightSide: true,
                onSubmitted: (text) {
                  final percent = double.tryParse(text) ?? zoom * 100.0;
                  onZoomChanged(percent * (1.0 / 100.0));
                },
                suffix: '%',
              ),
            ),
            SizedBox(
              width: ManualWidgetTesterTheme.of(context)
                  .generalTheme
                  .spaceBetweenTextBoxesAndButtonRows,
            ),
            SizedBox(
              width: ManualWidgetTesterTheme.of(context)
                  .zoomControlsTheme
                  .buttonRowWidth,
              child: ManualWidgetTesterButtonRow(
                disableRoundedCornersOnLeftSide: true,
                buttons: [
                  ManualWidgetTesterButtonInfo(
                    onButtonDown:
                        zoom > minZoom ? onZoomOutButtonPressed : null,
                    onButtonPressed: null,
                    child: ManualWidgetTesterTheme.of(context)
                        .zoomControlsTheme
                        .zoomOutIcon,
                  ),
                  ManualWidgetTesterButtonInfo(
                    onButtonDown: zoom < maxZoom ? onZoomInButtonPressed : null,
                    onButtonPressed: null,
                    child: ManualWidgetTesterTheme.of(context)
                        .zoomControlsTheme
                        .zoomInIcon,
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

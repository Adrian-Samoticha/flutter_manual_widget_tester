import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';
import 'package:sprintf/sprintf.dart';

import '../../ui_elements/heading.dart';
import 'infinite_scroll_view.dart';

class ManualWidgetTesterCustomSettingsDoubleEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsDoubleEditor(
      {Key? key,
      required this.themeSettings,
      required this.settingName,
      required this.currentValue,
      required this.onChanged,
      this.lowerLimit = double.negativeInfinity,
      this.upperLimit = double.infinity})
      : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final double currentValue;
  final void Function(double) onChanged;
  final double lowerLimit;
  final double upperLimit;

  static const double epsilon = 0.00000001;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsTheme.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(
              themeSettings: themeSettings, settingName: settingName),
          Column(
            children: [
              SizedBox(
                height: themeSettings.stringEditorTheme.stringEditorHeight,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Expanded(
                          child: _buildTextField(),
                        ),
                        SizedBox(
                          width: themeSettings
                              .generalTheme.spaceBetweenTextBoxesAndButtonRows,
                        ),
                        _buildButtonRow(constraints),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: themeSettings.doubleEditorTheme
                    .spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView,
              ),
              _buildInfiniteScrollView(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfiniteScrollView(BuildContext context) {
    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          GestureBinding.instance.pointerSignalResolver.register(
            event,
            (event) {
              final scrollDelta = (event as PointerScrollEvent).scrollDelta;
              final newValue = currentValue +
                  (scrollDelta.dx + scrollDelta.dy) *
                      Config.of(context)
                          .doubleEditorInfiniteScrollViewScrollSpeedFactor;
              onChanged(newValue);
            },
          );
        }
      },
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          final panDelta = details.delta;
          final newValue = currentValue +
              (-panDelta.dx - panDelta.dy) *
                  Config.of(context)
                      .doubleEditorInfiniteScrollViewScrollSpeedFactor;
          onChanged(newValue);
        },
        child: Container(
          width: double.infinity,
          height: themeSettings
              .doubleEditorTheme.doubleEditorInfiniteScrollViewHeight,
          padding: themeSettings
              .doubleEditorTheme.doubleEditorInfiniteScrollViewPadding,
          decoration: themeSettings
              .doubleEditorTheme.doubleEditorInfiniteScrollViewBoxDecoration,
          clipBehavior: Clip.hardEdge,
          child: InfiniteScrollView(
            themeSettings: themeSettings,
            currentValue: currentValue,
            infiniteScrollViewRange:
                Config.of(context).doubleEditorInfiniteScrollViewRange,
            lowerLimit: lowerLimit,
            upperLimit: upperLimit,
          ),
        ),
      ),
    );
  }

  ManualWidgetTesterTextField _buildTextField() {
    return ManualWidgetTesterTextField(
      initialValue: sprintf('%f', [currentValue]),
      onSubmitted: (String valueAsString) {
        final parsedValue = double.tryParse(valueAsString);
        onChanged(parsedValue ?? currentValue);
      },
      themeSettings: themeSettings,
      disableRoundedCornersOnRightSide: true,
    );
  }

  bool _isDoubleSimilar(double double1, double double2) {
    final delta = (double1 - double2).abs();
    return delta < epsilon;
  }

  SizedBox _buildButtonRow(BoxConstraints constraints) {
    return SizedBox(
      width: min(themeSettings.generalTheme.defaultNumberEditorButtonRowWidth,
          constraints.maxWidth * 0.5),
      child: ManualWidgetTesterButtonRow(
        themeSettings: themeSettings,
        disableRoundedCornersOnLeftSide: true,
        buttons: [
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('-')),
            onButtonPressed: null,
            onButtonDown: _isDoubleSimilar(currentValue, lowerLimit)
                ? null
                : () {
                    onChanged(currentValue - 0.2);
                  },
          ),
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('+')),
            onButtonPressed: null,
            onButtonDown: _isDoubleSimilar(currentValue, upperLimit)
                ? null
                : () {
                    onChanged(currentValue + 0.2);
                  },
          ),
        ],
      ),
    );
  }
}
